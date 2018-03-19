function mainTubularVoronoiModelProjectionSurface(numSeeds,basalExpansions,apicalReductions,numRandoms,Hinitial,Winitial)

    kindProjection={'expansion','reduction'};
    if isempty(basalExpansions)
        kindProjection={'reduction'};
    else if isempty(apicalReductions)
            kindProjection={'expansion'};
         end
    end
    
    directory2save='data\tubularVoronoiModel\';

    for typeP = 1 : length(kindProjection)

            nameOfFolder=[num2str(Winitial) 'x' num2str(Hinitial) '_' num2str(numSeeds) 'seeds\'];
            path3dVoronoi=['data\tubularCVT\Data\' nameOfFolder];

            pathV5data=dir([path3dVoronoi '*m_5*']);

            switch kindProjection{typeP}
                case {'expansion'}
                    %basalRadius/apicalRadius
                    listOfSurfaceRatios=basalExpansions;
                case {'reduction'}
                    %apicalRadius/basalRadius
                    listOfSurfaceRatios=apicalReductions;
            end

            %carry out Voronoi surface projections
             surfaceProjection(pathV5data,nameOfFolder,directory2save,path3dVoronoi,kindProjection{typeP},listOfSurfaceRatios,numSeeds)

            %calculate the presence of scutoids
            calculateNumberOfInvolvedCellsInTransitions(numSeeds,kindProjection{typeP},pathV5data,directory2save,length(listOfSurfaceRatios),Hinitial,Winitial)
            calculateNcellsAroundTrasversalSection(numSeeds,kindProjection{typeP},pathV5data,directory2save,length(listOfSurfaceRatios),Hinitial,Winitial)

            
            energyCalculationVoronoiTubularModel(directory2save,nameOfFolder,length(listOfSurfaceRatios),numRandoms,kindProjection{typeP},numSeeds,basalExpansions,apicalReductions)
            
            
    end

end
