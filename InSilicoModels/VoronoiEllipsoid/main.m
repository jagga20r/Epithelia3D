addpath(genpath('src'));
addpath(genpath('lib'));

allCombinations = {
%     15 10 10 [15, 20, 30] 'Zepellin'
    10 15 15 [15, 20, 30] 'FilledDonnut'
    10 10 10 [15, 20] 'Sphere'
    97.46-6.25 50.75-6.25 50.75-6.25 6.25 'Stage 8'
    38.57277778-5.506047536	31.61605556-5.506047536 31.61605556-5.506047536	5.506047536 'Stage 4'
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
        
        outputDirActual = [outputDirGlobal '\random_', num2str(numRandomization)];
        mkdir(outputDirActual);
        
        if min([radiusX, radiusY, radiusZ]) ~= 1
            radiusInModelY = 1;
            radiusZ = (radiusZ * radiusInModelY)/radiusY;
            radiusX = (radiusX * radiusInModelY)/radiusY;
            hCell = (hCell * radiusInModelY)/radiusY;
            radiusY = radiusInModelY;
        end
        
        randomEllipsoidInfo = voronoi3DEllipsoid([radiusX+max(hCell)+0.5 radiusY+max(hCell)+0.5 radiusZ+max(hCell)+0.5], [radiusX radiusY radiusZ], 200, outputDirActual, hCell);
        
        randomizationsInfo(numRandomization) = {randomEllipsoidInfo};
        
        ['randomization ' num2str(numRandomization) ' - finished']
    end
    
    
    rowTransitionOuter=cell(maxRandoms,2);
    rowNoTransitionOuter=cell(maxRandoms,2);
    rowTransitionInner=cell(maxRandoms,2);
    rowNoTransitionInner=cell(maxRandoms,2);
    
    for numEllipsoid = 1:maxRandoms
        randomEllipsoidInfo = randomizationsInfo{numEllipsoid};
        for numBorders=1:length(randomEllipsoidInfo.edgeTransitionMeasuredOuter)
            rowTransitionOuter{numEllipsoid,numBorders}=randomEllipsoidInfo.edgeTransitionMeasuredOuter{numBorders};
            rowNoTransitionOuter{numEllipsoid,numBorders}=randomEllipsoidInfo.edgeNoTransitionMeasuredOuter{numBorders};
            rowTransitionInner{numEllipsoid,numBorders}=randomEllipsoidInfo.edgeTransitionMeasuredInner{numBorders};
            rowNoTransitionInner{numEllipsoid,numBorders}=randomEllipsoidInfo.edgeNoTransitionMeasuredInner{numBorders};
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

