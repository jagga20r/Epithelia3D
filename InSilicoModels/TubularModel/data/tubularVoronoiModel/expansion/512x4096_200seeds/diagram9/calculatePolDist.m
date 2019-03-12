%calculate polygon distribution

addpath(genpath('..\..\..\..\..\src'))
nDiagram = 9;
nRealizations = 20;
sr = 1.85;

polygonDis = cell(1,nRealizations);
logNormArea = cell(1,nRealizations);
basalSidesCells = cell(1,nRealizations);
apicalSidesCells = cell(1,nRealizations);
normArea = cell(1,nRealizations);
totalSidesCells = cell(1,nRealizations);
for nRea = 1:nRealizations
    
    load(['Image_' num2str(nRea) '_Diagram_' num2str(nDiagram) '\Image_' num2str(nRea) '_Diagram_' num2str(nDiagram) 'specialCase.mat'])
    indSr = listLOriginalProjection.surfaceRatio == sr;
    indApical = listLOriginalProjection.surfaceRatio == 1;
    L_basal = listLOriginalProjection.L_originalProjection{indSr};
    L_apical = listLOriginalProjection.L_originalProjection{indApical};

    [neighsBasal,sidesCellsBasal]=calculateNeighbours(L_basal);
    [neighsApical,sidesCellsApical]=calculateNeighbours(L_apical);
    
    noValidCells = unique([L_basal(1,:),L_basal(end,:)]);
    validCells = setdiff(unique(L_basal),noValidCells);
    
    polygonDisImg = calculate_polygon_distribution(sidesCellsBasal,validCells);
    polygonDis{nRea} = polygonDisImg(2,:);
    
    
    areaCells = regionprops(L_basal,'Area');
    areaCells = cat(1,areaCells.Area);
    areaValidCells = areaCells(validCells);
    logNormArea{nRea} = log10(areaValidCells./(mean(areaValidCells)));
    normArea{nRea} = areaValidCells./(mean(areaValidCells));
    basalSidesCells{nRea} = sidesCellsBasal(validCells);
    apicalSidesCells{nRea} = sidesCellsApical(validCells);
    
    totalSidesCells{nRea} = cellfun(@(x,y) length(unique([x;y])),neighsBasal(validCells),neighsApical(validCells));

end

polyDist = cell2mat(vertcat(polygonDis{:}));
meanPolyDist = mean(polyDist);
stdPolyDist = std(polyDist);
dispersionLogNormArea = vertcat(logNormArea{:});
dispersionNormArea = vertcat(normArea{:});

relationNormArea_numSides = [horzcat(basalSidesCells{:})',dispersionNormArea];
uniqSides = unique(horzcat(basalSidesCells{:}));
lewis_NormArea = [uniqSides;arrayfun(@(x) mean(relationNormArea_numSides(ismember(relationNormArea_numSides(:,1),x),2)),uniqSides);
    arrayfun(@(x) std(relationNormArea_numSides(ismember(relationNormArea_numSides(:,1),x),2)),uniqSides)];


save(['polygonDistribution_diag_' num2str(nDiagram) 'sr' num2str(sr) '.mat'],'meanPolyDist','stdPolyDist','polyDist','dispersionLogNormArea','dispersionNormArea','lewis_NormArea','apicalSidesCells','totalSidesCells')


