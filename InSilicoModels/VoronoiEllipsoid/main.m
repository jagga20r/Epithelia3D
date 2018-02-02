addpath(genpath('src'));
addpath(genpath('lib'));

% X should be the greater number. Z should be the axis with the greater
% curvature.
allCombinations = {
%     15 10 10 [15, 20, 30] 'Zepellin'
%    10 15 15 [15, 20, 30] 'FilledDonnut'
    10 10 10 [1, 2, 3] 'Sphere' 200
    97.46-6.145760671 48.32738462-6.145760671 48.32738462-6.145760671 6.145760671 'Stage 8' 450
    36-5.369186755	29.59784615-5.369186755 29.59784615-5.369186755	5.369186755 'Stage 4' 200
    };

maxRandoms = 20;
delete(gcp);
parpool(2);

for numCombination = 1:size(allCombinations, 1)
    
    
    fileName = allCombinations{numCombination, 5};
    outputDirGlobal= ['results\' fileName];
    
    
    randomizationsInfo = cell(maxRandoms, 1);
    
    for numRandomization = 1:maxRandoms %%parfor
        
        radiusX = allCombinations{numCombination, 1};
        radiusY = allCombinations{numCombination, 2};
        radiusZ = allCombinations{numCombination, 3};
        hCell = allCombinations{numCombination, 4};
        numCells = allCombinations{numCombination, 6};
        
        outputDirActual = [outputDirGlobal '\random_', num2str(numRandomization)];
        mkdir(outputDirActual);
        
        if min([radiusX, radiusY, radiusZ]) ~= 1
            radiusInModelY = 1;
            radiusZ = (radiusZ * radiusInModelY)/radiusY;
            radiusX = (radiusX * radiusInModelY)/radiusY;
            hCell = (hCell * radiusInModelY)/radiusY;
            radiusY = radiusInModelY;
        end
        
        randomEllipsoidInfo = voronoi3DEllipsoid([radiusX+max(hCell)+0.5 radiusY+max(hCell)+0.5 radiusZ+max(hCell)+0.5], [radiusX radiusY radiusZ], numCells, outputDirActual, hCell);
        
        randomizationsInfo(numRandomization) = {randomEllipsoidInfo};
        
        ['randomization ' num2str(numRandomization) ' - finished']
    end
    
    
    rowTransitionOuter=cell(maxRandoms*length(allCombinations{numCombination, 4}),2);
    rowNoTransitionOuter=cell(maxRandoms*length(allCombinations{numCombination, 4}),2);
    rowTransitionInner=cell(maxRandoms*length(allCombinations{numCombination, 4}),2);
    rowNoTransitionInner=cell(maxRandoms*length(allCombinations{numCombination, 4}),2);
    
    for numEllipsoid = 1:maxRandoms
        randomEllipsoidInfo = randomizationsInfo{numEllipsoid};
        for numHeight = 1:length(allCombinations{numCombination, 4})
            for numBorders=1:length(randomEllipsoidInfo.edgeTransitionMeasuredOuter)
                numRow = (length(allCombinations{numCombination, 4}) * (numEllipsoid - 1)) + numHeight;
                rowTransitionOuter{numRow,numBorders}=randomEllipsoidInfo.edgeTransitionMeasuredOuter{numHeight, numBorders};
                rowNoTransitionOuter{numRow,numBorders}=randomEllipsoidInfo.edgeNoTransitionMeasuredOuter{numHeight, numBorders};
                rowTransitionInner{numRow,numBorders}=randomEllipsoidInfo.edgeTransitionMeasuredInner{numHeight, numBorders};
                rowNoTransitionInner{numRow,numBorders}=randomEllipsoidInfo.edgeNoTransitionMeasuredInner{numHeight, numBorders};
            end
        end
    end
    
    for numBorders=1:size(rowTransitionOuter,2)
        borderLimit=rowTransitionOuter{1,numBorders}.bordersSituatedAt(1);
        writetable(vertcat(rowTransitionOuter{:,numBorders}), [outputDirGlobal '\transitionsOuterBorder' num2str(borderLimit) '_' fileName '_' date '.xls']);
        writetable(vertcat(rowNoTransitionOuter{:,numBorders}), [outputDirGlobal '\noTransitionsOuterBorder' num2str(borderLimit) '_' fileName '_' date '.xls']);
        writetable(vertcat(rowTransitionInner{:,numBorders}), [outputDirGlobal  '\transitionsInnerBorder' num2str(borderLimit) '_' fileName '_' date '.xls']);
        writetable(vertcat(rowNoTransitionInner{:,numBorders}), [outputDirGlobal '\noTransitionsInnerBorder' num2str(borderLimit) '_' fileName '_' date '.xls']);
    end
    save(strcat(outputDirGlobal, '\randomizationsInfo_', date), 'randomizationsInfo');
    close all
end
%writetable(vertcat(transitionByRadiusAll{:}), strcat('results\transitionsInfoAllRandomizations_', date, '.xls'))
%Calculate mean of all the transitions
%calculateMeanOfXls(strcat('results\transitionsInfoAllRandomizations_', date, '.xls'));

