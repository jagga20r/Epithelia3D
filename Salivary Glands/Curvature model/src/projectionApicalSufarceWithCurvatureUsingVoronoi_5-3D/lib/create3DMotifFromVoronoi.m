function [ ] = create3DMotifFromVoronoi( )
%CREATE3DMOTIFFROMVORONOI Summary of this function goes here
%   Detailed explanation goes here
    load('D:\Pablo\Epithelia3D\Salivary Glands\Curvature model\data\Image_10.mat')
    
    selectedCells = 1:max(listLOriginalProjection.L_originalProjection{1});
    %% Rb/Ra = 2
    pixelsPerCell = {};
    maxPlanes = 6;
    for selectedCell = 1:size(selectedCells, 2)
        for numPlane = 1:maxPlanes
            actualPlaneImg = cell2mat(listLOriginalProjection.L_originalProjection(numPlane));
            
            [imgRows,imgCols] = size(actualPlaneImg);
            [X,Y,~] = cylinder(imgRows,imgCols);
            X=X*0.2*listLOriginalProjection.surfaceRatio(numPlane);
            Y=Y*0.2*listLOriginalProjection.surfaceRatio(numPlane);
%             hRef = warp(X,Y,Z,actualPlaneImg);
            
            [actualCellPxX, actualCellPxY] = find(actualPlaneImg == selectedCells(selectedCell));
            
            actualCellPxX = actualCellPxX';
            actualCellPxZ = X(1, actualCellPxY);
            actualCellPxY = Y(1, actualCellPxY);
            
            actualCellPxs = vertcat(actualCellPxX, actualCellPxY, actualCellPxZ);
            
            %actualCellBoundary = boundary(actualCellPxX', actualCellPxY', actualCellPxZ', 0);
            boundaryPxs = actualCellPxs';
            if numPlane == 1
                pixelsPerCell{selectedCell} = boundaryPxs;
            else
                pixelsPerCell{selectedCell} = vertcat(pixelsPerCell{selectedCell}, boundaryPxs);
            end
        end
        pixelsPerCell;
    end
    
    %colours = [255 255 51;  255 0 0; 102 153 51; 102 153 255] / 255;
    colours = colorcube(50);
%    plotFigure3DFromCellBoundaries(pixelsPerCell, colours);
    figure;
    for numCell = 1:size(selectedCells, 2);
        actualCellPxs = pixelsPerCell{numCell};
        xCell = actualCellPxs(:, 1);
        yCell = actualCellPxs(:, 2);
        zCell = actualCellPxs(:, 3);
        actualCellPxs = [xCell, yCell, zCell];
        k = boundary(actualCellPxs, 0);
        trisurf(k, xCell, yCell, zCell, 'FaceColor', colours(numCell, :), 'EdgeColor', 'none', 'AmbientStrength', 0.3, 'FaceAlpha', 1);
        hold on;
    end
end

