function [] = paintLineTensionEdges( energyExcel, surfaceRatio, totalEnergyData, typeOfSimulation, inputDirectory, cellsAnalysed)
%PAINTLINETENSIONEDGES Summary of this function goes here
%   Detailed explanation goes here

	minValue = 0.5;
    maxValue = 1.5;
    maxColours = 100;

    maxRandoms = 20;
    colours = colormap(jet(maxColours));
    colours(1, :) = [1 1 1];
    for nRandom = 1%:maxRandoms
        actualEnergyExcel = energyExcel(energyExcel.nRand == nRandom, :);
        actualTotalEnergy = totalEnergyData(energyExcel.nRand == nRandom, :);
        
        uniqueCells = unique(actualEnergyExcel{:, 1:4});
        
        if isequal(typeOfSimulation, 'Voronoi')
            load(strcat(inputDirectory, 'Voronoi\2048x4096_200seeds\Image_', num2str(nRandom), '_Diagram_5\Image_', num2str(nRandom),'_Diagram_5.mat'));
            imageLabelled = listLOriginalProjection(round(listLOriginalProjection.surfaceRatio, 2) == round(surfaceRatio, 2), :).L_originalProjection{1};
            
            heatMapImage = zeros(size(imageLabelled));
            imgOnlyEdges = imdilate(imageLabelled == 0, strel('disk', 3));
            for numRow = 1:size(actualEnergyExcel, 1)
                neighbouringCells = actualEnergyExcel{numRow, 1:2};
                cell1Dilated = imdilate(ismember(imageLabelled, neighbouringCells(1)), strel('disk', 4));
                cell2Dilated = imdilate(ismember(imageLabelled, neighbouringCells(2)), strel('disk', 4));
                dilatedImg = cell1Dilated & cell2Dilated;
                heatmapValue = (actualTotalEnergy(numRow, 1) - minValue)/(maxValue-minValue)*maxColours;
                heatMapImage(dilatedImg & imgOnlyEdges) = round(heatmapValue);
            end
            
            h = figure ('Visible', 'off');
            imshow(heatMapImage, colours);
            hold on;
            cellPerimeters = regionprops(imageLabelled, {'Centroid', 'Perimeter'});
            borderCells = unique([imageLabelled(:, 1), imageLabelled(:, end)]);
            for numCell = 1:length(uniqueCells)
                actualCell = uniqueCells(numCell);
                if ismember(actualCell, borderCells)
                    continue;
                end
                actualCentroid = cellPerimeters(actualCell).Centroid;
                text(actualCentroid(1), actualCentroid(2), num2str(round(cellPerimeters(actualCell).Perimeter/(1e3), 1)), 'Color', 'white', 'HorizontalAlignment', 'center');
            end
        else
            load(strcat(inputDirectory, 'AllFrusta\2048x4096_200seeds\randomization', num2str(nRandom), '\totalVerticesData.mat'));
            imageLabelled = L_img;
            imageLabelled = imresize(imageLabelled, [size(imageLabelled, 1) size(imageLabelled, 2)*surfaceRatio], 'nearest');
            
            frustaInfo = frustaTable(round(frustaTable.surfaceRatio, 2) == round(surfaceRatio, 2), :);
            
            heatMapImage = zeros(size(imageLabelled));
        
            borderVertices = find(arrayValidVerticesBorderLeft | arrayValidVerticesBorderRight);
            
            blankImage = zeros(size(imageLabelled));
            
            for numRow = 1:size(actualEnergyExcel, 1)
                neighbouringCells = actualEnergyExcel{numRow, 1:2};
                %Cells that are not  connected but share the edge of the motif
                edgeEndCells = actualEnergyExcel{numRow, 3:4};
                
                numVertex1 = find(ismember(frustaInfo.vertices.verticesConnectCells, sort(horzcat(neighbouringCells, edgeEndCells(1))), 'rows'));
                numVertex2 = find(ismember(frustaInfo.vertices.verticesConnectCells, sort(horzcat(neighbouringCells, edgeEndCells(2))), 'rows'));
                
                if ismember(numVertex1, borderVertices) || ismember(numVertex2, borderVertices)
                    continue;
                end
                
                vertex1 = frustaInfo.vertices.verticesPerCell{numVertex1};
                vertex2 = frustaInfo.vertices.verticesPerCell{numVertex2};
                
                [xToPaint, yToPaint] = Drawline3D(vertex1(1), vertex1(2), 0, vertex2(1), vertex2(2), 0);
                  
                indicesToPaint = sub2ind(size(imageLabelled),xToPaint, yToPaint);
                
                blankImage(indicesToPaint) = 1;
                %New indices dilated
                indicesToPaint = find(imdilate(blankImage, strel('disk', 4)));

                heatmapValue = (actualTotalEnergy(numRow, 1) - minValue)/(maxValue-minValue)*maxColours;
                heatMapImage(indicesToPaint) = round(heatmapValue);
                blankImage(indicesToPaint) = 0;
            end
            
            
            perimeterCells = zeros(max(uniqueCells), 1);
            h = figure ('Visible', 'off');
            imshow(heatMapImage, colours)
            hold on;
            for numCell = 1:length(uniqueCells)
                actualCell = uniqueCells(numCell);  
                actualVertices = any(frustaInfo.vertices.verticesConnectCells == actualCell, 2);
                actualVertices = frustaInfo.vertices.verticesPerCell(actualVertices);
                actualVertices = vertcat(actualVertices{:});
                verticesConvexHull = convhull(actualVertices);
                if length(verticesConvexHull)-1 ~= size(actualVertices, 1)
                    continue
                end
                actualVertices = actualVertices(verticesConvexHull(1:end-1), :);
                polyin = polyshape(actualVertices);
                %plot(polyin)
                %hold on;
                [Cx, Cy] = centroid(polyin);
                text(Cy, Cx, num2str(round(polyin.perimeter/(1e3), 1)), 'Color', 'white', 'HorizontalAlignment', 'center');
                perimeterCells(actualCell) = polyin.perimeter;
            end
            
            %perimeterCells
            
%             contractilityPerVertex = zeros(size(frustaInfo.vertices.verticesPerCell, 1), 1);
%             
%             contractibilityEquation = @(cellsPerimeters) sum(cellsPerimeters.^2);
%             
%             for numVertex = 1:size(contractilityPerVertex, 1)
%                 actualPerimeters = perimeterCells(frustaInfo.vertices.verticesConnectCells(numVertex, :));
%                 if any(actualPerimeters == 0)
%                     continue
%                 end
%                 contractilityPerVertex(numVertex) = contractibilityEquation(actualPerimeters);
%             end
            
            
        end
        
        reductionOrExpansion = strsplit(inputDirectory, '\');
        reductionOrExpansion = reductionOrExpansion{end-1};
        
        if isempty(cellsAnalysed)
            outputDir = strcat('results/', reductionOrExpansion, '/', typeOfSimulation ,'/Random_', num2str(nRandom), '/');
        else
            outputDir = strcat('results/', reductionOrExpansion, '/', cellsAnalysed, '/', typeOfSimulation ,'/Random_', num2str(nRandom), '/');
        end
        
        mkdir(outputDir)
%         h = figure('visible', 'off');
%         imshow(heatMapImage, colours);
%         colorbar('northoutside')
%         print(h, strcat(outputDir, 'lineTensionPlot_NRandom', num2str(nRandom), '_withColorBar.tif'), '-dtiff', '-r300')
%         close(h);

        [row, col] = find(heatMapImage > 0);
        bounding_box = [min(row), min(col), max(row) - min(row) + 1, max(col) - min(col) + 1];

        % display with rectangle
        rect = bounding_box([2,1,4,3]); % rectangle wants x,y,w,h we have rows, columns, ... need to convert
        
        %Cropping region of figure
        set(gca, 'XLim', [min(col) max(col)])
        set(gca, 'YLim', [min(row) max(row)])
        print(h, strcat(outputDir, 'lineTensionAndPerimeters_SurfaceRatio', strrep(num2str(surfaceRatio), '.', '-'), '.tif'), '-dtiff', '-r600');
        close(h)
        colours(1, :, :) = [0 0 0];
        imwrite(imcrop(heatMapImage, rect), colours, strcat(outputDir, 'lineTensionPlot_SurfaceRatio', strrep(num2str(surfaceRatio), '.', '-'), '.tif'))
    end
end

