function [polygon_distribution_Apical, polygon_distribution_Basal, neighboursData,neighboursUnrollTube,polygon_distribution_UnrollTube,selpath] = pipeline()
%PIPELINE Summary of this function goes here
%   Detailed explanation goes here
    selpath = uigetdir('data');

    if isempty(selpath) == 0
        outputDir = selpath;

        mkdir(fullfile(outputDir, 'Cells', 'OutputLimeSeg'));
        mkdir(fullfile(outputDir, 'ImageSequence'));
        mkdir(fullfile(outputDir, 'Lumen'));
        mkdir(fullfile(outputDir, 'Results'));


        resizeImg = 0.25;

        tipValue = 4;

        imageSequenceFiles = dir(fullfile(outputDir, 'ImageSequence/*.tif'));
        NoValidFiles = startsWith({imageSequenceFiles.name},'._','IgnoreCase',true);
        imageSequenceFiles=imageSequenceFiles(~NoValidFiles);
        demoFile =  imageSequenceFiles(3);
        demoImg = imread(fullfile(demoFile.folder, demoFile.name));

        imgSize = round(size(demoImg)*resizeImg);

        if exist(fullfile(selpath, 'Results', '3d_layers_info.mat')) == 2
            load(fullfile(selpath, 'Results', '3d_layers_info.mat'))
        else
            [labelledImage, basalLayer] = processCells(fullfile(outputDir, 'Cells', filesep), resizeImg, imgSize, tipValue);
        end
        
        [labelledImage, apicalLayer, lumenImage] = processLumen(fullfile(outputDir, 'Lumen', filesep), labelledImage, resizeImg, tipValue);

        [colours] = exportAsImageSequence(labelledImage, fullfile(outputDir, 'Cells', 'labelledSequence', filesep), [], tipValue);

        setappdata(0,'outputDir', outputDir);
        setappdata(0,'labelledImage',labelledImage);
        setappdata(0, 'lumenImage', lumenImage);
        setappdata(0,'resizeImg',resizeImg);
        setappdata(0,'tipValue', tipValue);

        if exist(fullfile(selpath, 'Results', 'valid_cells.mat'), 'file')
            load(fullfile(selpath, 'Results', 'valid_cells.mat'))
        else
            [noValidCells] = insertNoValidCells();
            validCells = setdiff(1:max(labelledImage(:)), noValidCells);
            save(fullfile(selpath, 'Results', 'valid_cells.mat'), 'noValidCells', 'validCells')
        end
        [answer, apical3dInfo, notFoundCellsApical, basal3dInfo, notFoundCellsBasal] = calculateMissingCells(labelledImage, lumenImage, apicalLayer, basalLayer, colours, noValidCells);

        %% Insert no valid cells
        while isequal(answer, 'Yes')
            h = window();
            waitfor(h);

            savingResults = saveResults();

            if isequal(savingResults, 'Yes')
                labelledImage = getappdata(0, 'labelledImageTemp');
                close all
                exportAsImageSequence(labelledImage, fullfile(outputDir, 'Cells', 'labelledSequence', filesep), colours, tipValue);

                %% Calculate neighbours and plot missing cells
                if exist(fullfile(selpath, '3d_layers_info.mat')) == 0
                    [basalLayer] = getBasalFrom3DImage(labelledImage, tipValue);
                    [apicalLayer] = getApicalFrom3DImage(lumenImage, labelledImage);
                    [answer, apical3dInfo, notFoundCellsApical, basal3dInfo, notFoundCellsBasal] = calculateMissingCells(labelledImage, lumenImage, apicalLayer, basalLayer, colours, noValidCells);
                end

            else
                [answer] = isEverythingCorrect();
            end
        end
        %% Save apical and basal 3d information
        save(fullfile(selpath, 'Results', '3d_layers_info.mat'), 'labelledImage', 'basalLayer', 'apicalLayer', 'apical3dInfo', 'basal3dInfo', '-v7.3')

        %% Calculate poligon distribution and Unroll the tube.
        [polygon_distribution_Apical] = calculate_polygon_distribution(cellfun(@length, apical3dInfo.neighbourhood), validCells);
        [polygon_distribution_Basal] = calculate_polygon_distribution(cellfun(@length, basal3dInfo.neighbourhood), validCells);
        neighboursData = {apical3dInfo.neighbourhood, basal3dInfo.neighbourhood};

        [neighs_apical,apical_cells, apicalAreaValidCells] = unrollTube(apicalLayer, fullfile(selpath,  'Results', 'apical'), noValidCells, colours);
        [polygon_distribution_UnrollTubeApical] = calculate_polygon_distribution(apical_cells, validCells);
        
        [neighs_basal,basal_cells] = unrollTube(basalLayer, fullfile(selpath, 'Results', 'basal'), noValidCells, colours, apicalAreaValidCells);
        [polygon_distribution_UnrollTubeBasal] = calculate_polygon_distribution(basal_cells, validCells);
        
        neighboursUnrollTube = {neighs_apical,neighs_basal};
        polygon_distribution_UnrollTube = {polygon_distribution_UnrollTubeApical,polygon_distribution_UnrollTubeBasal};
    end
end

