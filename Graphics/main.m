
nameFiles = {'D:\Pablo\Epithelia3D\InSilicoModels\EllipsoidModel\voronoiEllipsoidModel\results\Stage 4\energy\spheroidVoronoiModelEnergy_Stage 4_Transition_12-Apr-2018.xls', ...
    'D:\Pablo\Epithelia3D\InSilicoModels\EllipsoidModel\voronoiEllipsoidModel\results\Stage 4\energy\spheroidVoronoiModelEnergy_Stage 4_NoTransition_12-Apr-2018.xls', ...
    'D:\Pablo\Epithelia3D\InSilicoModels\EllipsoidModel\voronoiEllipsoidModel\results\Stage 8\energy\spheroidVoronoiModelEnergy_Stage 8_NoTransition_03-Apr-2018.xls', ...
    'D:\Pablo\Epithelia3D\InSilicoModels\EllipsoidModel\voronoiEllipsoidModel\results\Stage 8\energy\spheroidVoronoiModelEnergy_Stage 8_Transition_03-Apr-2018.xls', ...
    'D:\Pablo\Epithelia3D\InSilicoModels\TubularModel\docs\800Seeds_Energy\voronoiModelEnergy_800seeds_surfaceRatio1.6667_NoTransitions_07-Apr-2018.xls', ...
    'D:\Pablo\Epithelia3D\InSilicoModels\TubularModel\docs\800Seeds_Energy\voronoiModelEnergy_800seeds_surfaceRatio1.6667_Transitions_07-Apr-2018.xls', ...
    'D:\Pablo\Epithelia3D\InSilicoModels\TubularModel\docs\800Seeds_Energy\voronoiModelEnergy_800seeds_surfaceRatio2_NoTransitions_07-Apr-2018.xls', ...
    'D:\Pablo\Epithelia3D\InSilicoModels\TubularModel\docs\800Seeds_Energy\voronoiModelEnergy_800seeds_surfaceRatio2_Transitions_07-Apr-2018.xls', ...
    'D:\Pablo\Epithelia3D\InSilicoModels\TubularModel\docs\800Seeds_Energy\voronoiModelEnergy_800seeds_surfaceRatio5_NoTransitions_08-Apr-2018.xls', ...
    'D:\Pablo\Epithelia3D\InSilicoModels\TubularModel\docs\800Seeds_Energy\voronoiModelEnergy_800seeds_surfaceRatio5_Transitions_08-Apr-2018.xls', ...
    'D:\Pablo\Epithelia3D\InSilicoModels\TubularModel\docs\60Seeds_Energy\voronoiModelEnergy_60seeds_surfaceRatio6.6667_Transitions_04-Apr-2018.xls'};

for numFile = length(nameFiles)
    getRandomSampling(nameFiles{numFile}, 100)
end