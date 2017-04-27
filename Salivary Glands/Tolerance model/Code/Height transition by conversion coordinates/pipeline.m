%%pipeline

rootPath='D:\Pedro\Epithelia3D\';


salivaryGlandFolder='Salivary Glands\Confocal stacks\Segmented images data\';

WTpaths={[rootPath salivaryGlandFolder 'Wild type\13-06-16\gland 1 (sqhgfp ecadh gfp ed 1a 20x)\Label_sequence.mat'];...
[rootPath salivaryGlandFolder 'Wild type\13-06-16\gland 2 (sqhgfp ecadh gfp ed 2a 20x)\Label_sequence.mat'];...
[rootPath salivaryGlandFolder 'Wild type\13-06-16\gland 3 (sqhgfp ecadh gfp ed 3a 20x)\Label_sequence.mat'];...
[rootPath salivaryGlandFolder 'Wild type\13-06-16\gland 4 (sqhgfp ecadh gfp ed 4a 20x)\Label_sequence.mat'];...
[rootPath salivaryGlandFolder 'Wild type\13-06-16\gland 5 (sqhgfp ecadh gfp ed 5a 20x)\Label_sequence.mat'];...
[rootPath salivaryGlandFolder 'Wild type\21-03-16\gland 6 (sqhgfp ecadh gfp ed 2a 20x)\Label_sequence.mat'];...
[rootPath salivaryGlandFolder 'Wild type\10-11-16\gland 7 (sqhgfp pha sqhgfp dapi 20X 1a)\Label_sequence.mat'];...
[rootPath salivaryGlandFolder 'Wild type\10-11-16\gland 8 (sqhgfp pha sqhgfp dapi 20X 2a)\Label_sequence.mat']};

Ecadhipaths={[rootPath salivaryGlandFolder 'E-cadh inhibited\15-09-16\Gland_1 (Ab-1-Gal4 U-Ecadhi Fal Ecadh 2a 20X)\Label_sequence.mat'];
[rootPath salivaryGlandFolder 'E-cadh inhibited\15-09-16\Gland_2 (Ab-1-Gal4 U-Ecadhi Fal Ecadh 3a 20X)\Label_sequence.mat'];
[rootPath salivaryGlandFolder 'E-cadh inhibited\15-09-16\Gland_3 (Ab-1-Gal4 U-Ecadhi Fal Ecadh 5a 20X)\Label_sequence.mat'];
[rootPath salivaryGlandFolder 'E-cadh inhibited\15-09-16\Gland_4 (Ab-1-Gal4 U-Ecadhi Fal Ecadh 6a 20X)\Label_sequence.mat']};

CultEpaths={[rootPath 'culture epithelia\Segmented images data\24-11-16\n0\Label_sequence.mat'];
[rootPath 'culture epithelia\Segmented images data\24-11-16\n1\Label_sequence.mat'];
[rootPath 'culture epithelia\Segmented images data\24-11-16\n2\Label_sequence.mat']};

Prolifpaths={[rootPath salivaryGlandFolder 'Overproliferation\27-01-2017\gland 3 (348 350 AB1 x 0748 Phal eCadh DAPI 20X 1a)\Label_sequence.mat'];
[rootPath salivaryGlandFolder 'Overproliferation\27-01-2017\gland 4 (348 350 AB1 x 0748 Phal eCadh DAPI 20X 3a)\Label_sequence.mat'];
[rootPath salivaryGlandFolder 'Overproliferation\27-01-2017\gland 5 (348 350 AB1 x 0748 Phal eCadh DAPI 20X 2a)\Label_sequence.mat']};


micronsToPixels = 1024/631.02; %microns*(pixels/microns)= pixels;


hTranWT={};
hTranEc={};
hTranProf={};

%[hTranWTsition,hTranWTsitionPredict]=recalculateCentroidsGlandsHeightTranPrediction(pathStructure, frame, cellsGroup, hTranWTsition, curvature, D , alpha,hCell,validCentroidCell)

%% Transition

%WT
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{1},1,[15,18,13,21],65.23*micronsToPixels,0.204,222.09*micronsToPixels,deg2rad(29.5),103.28*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{1},'end',[57,59,54,12],58*micronsToPixels,0.217,231.03*micronsToPixels,deg2rad(0.5),90.22*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{1},'end',[60,62,61,69],66.39*micronsToPixels,0.204,222.09*micronsToPixels,deg2rad(12.5),103.28*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{1},'end',[68,67,22,58],57.2*micronsToPixels,0.192,237.09*micronsToPixels,deg2rad(20),98.05*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{2},1,[7,5,17,3],86.81*micronsToPixels,0.214,232.7*micronsToPixels,deg2rad(21.1),107.23*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{2},'end',[50,53,38,43],69.31*micronsToPixels,0.240,216.66*micronsToPixels,deg2rad(26),83.17*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{2},'end',[51,49,3,42],80.42*micronsToPixels,0.214,232.7*micronsToPixels,deg2rad(4),107.23*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{3},'end',[79,73,75,56],82.18*micronsToPixels,0.152,232.05*micronsToPixels,deg2rad(12.2),98.62*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{3},'end',[64,69,68,42],103.5*micronsToPixels,0.151,269.09*micronsToPixels,deg2rad(2.1),111.46*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{3},1,[17,18,7,35],94.62*micronsToPixels,0.143,236.59*micronsToPixels,deg2rad(10),99.6*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{4},1,[21,29,18,37],37.97*micronsToPixels,0.261,191.41*micronsToPixels,deg2rad(29.5),71.72*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{4},'end',[78,74,80,53],41.21*micronsToPixels,0.256,195.97*micronsToPixels,deg2rad(21),73.68*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{4},'end',[71,69,70,56],34.9*micronsToPixels,0.213,183.45*micronsToPixels,deg2rad(23),68.68*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{5},1,[11,16,12,17],50.6*micronsToPixels,0.243,162.65*micronsToPixels,deg2rad(1),65.06*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{5},1,[16,20,15,24],40.85*micronsToPixels,0.197,162.48*micronsToPixels,deg2rad(18),73.53*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{5},1,[25,31,28,29],52.93*micronsToPixels,0.373,178.76*micronsToPixels,deg2rad(30),57*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{5},'end',[79,77,3,78],52.38*micronsToPixels,0.235,170.87*micronsToPixels,deg2rad(16),65.47*micronsToPixels,3); %rareeee motif
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{5},'end',[84,87,83,64],45.41*micronsToPixels,0.254,165.63*micronsToPixels,deg2rad(26.5),63.57*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{6},3,[23,16,17,21],38.14*micronsToPixels,0.180,167.85*micronsToPixels,deg2rad(1),68.65*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{6},'end',[69,65,46,64],53.53*micronsToPixels,0.203,168.46*micronsToPixels,deg2rad(8),66.91*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{6},'end',[65,83,66,56],39.23*micronsToPixels,0.180,167.85*micronsToPixels,deg2rad(29),68.65*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{6},'end',[73,75,78,74],49.49*micronsToPixels,0.284,176.30*micronsToPixels,deg2rad(49),65.98*micronsToPixels,3);
[hTranWT{end+1,1},hTranWT{end+1,2},hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{7},1,[34,32,22,40],35.94*micronsToPixels,0.109,140.62*micronsToPixels,deg2rad(3.5),62.9*micronsToPixels,3);


% %Ecadhi

[hTranEc{end+1,1},hTranEc{end+1,2},hTranEc{end+1,3},hTranEc{end+1,4},hTranEc{end+1,5},hTranEc{end+1,6},hTranEc{end+1,7},hTranEc{end+1,8},hTranEc{end+1,9},hTranEc{end+1,10},hTranEc{end+1,11},hTranEc{end+1,12},hTranEc{end+1,13},hTranEc{end+1,14},hTranEc{end+1,15},hTranEc{end+1,16},hTranEc{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Ecadhipaths{1},1,[11,7,9,10],12.05*micronsToPixels,0.218,68.53*micronsToPixels,deg2rad(11.3),27.11*micronsToPixels,3); %rareeee motif
[hTranEc{end+1,1},hTranEc{end+1,2},hTranEc{end+1,3},hTranEc{end+1,4},hTranEc{end+1,5},hTranEc{end+1,6},hTranEc{end+1,7},hTranEc{end+1,8},hTranEc{end+1,9},hTranEc{end+1,10},hTranEc{end+1,11},hTranEc{end+1,12},hTranEc{end+1,13},hTranEc{end+1,14},hTranEc{end+1,15},hTranEc{end+1,16},hTranEc{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Ecadhipaths{1},1,[24,27,25,29],25.44*micronsToPixels,0.19,81.13*micronsToPixels,deg2rad(21),36.34*micronsToPixels,3);
[hTranEc{end+1,1},hTranEc{end+1,2},hTranEc{end+1,3},hTranEc{end+1,4},hTranEc{end+1,5},hTranEc{end+1,6},hTranEc{end+1,7},hTranEc{end+1,8},hTranEc{end+1,9},hTranEc{end+1,10},hTranEc{end+1,11},hTranEc{end+1,12},hTranEc{end+1,13},hTranEc{end+1,14},hTranEc{end+1,15},hTranEc{end+1,16},hTranEc{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Ecadhipaths{1},'end',[85,75,83,43],30.3*micronsToPixels,0.236,79.9*micronsToPixels,deg2rad(15),30.3*micronsToPixels,3);
[hTranEc{end+1,1},hTranEc{end+1,2},hTranEc{end+1,3},hTranEc{end+1,4},hTranEc{end+1,5},hTranEc{end+1,6},hTranEc{end+1,7},hTranEc{end+1,8},hTranEc{end+1,9},hTranEc{end+1,10},hTranEc{end+1,11},hTranEc{end+1,12},hTranEc{end+1,13},hTranEc{end+1,14},hTranEc{end+1,15},hTranEc{end+1,16},hTranEc{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Ecadhipaths{1},'end',[89,88,47,45],72.9*micronsToPixels,0.246,90.21*micronsToPixels,deg2rad(16.5),44.59*micronsToPixels,3);
[hTranEc{end+1,1},hTranEc{end+1,2},hTranEc{end+1,3},hTranEc{end+1,4},hTranEc{end+1,5},hTranEc{end+1,6},hTranEc{end+1,7},hTranEc{end+1,8},hTranEc{end+1,9},hTranEc{end+1,10},hTranEc{end+1,11},hTranEc{end+1,12},hTranEc{end+1,13},hTranEc{end+1,14},hTranEc{end+1,15},hTranEc{end+1,16},hTranEc{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Ecadhipaths{2},1,[21,17,16,23],41.09*micronsToPixels,0.157,111.72*micronsToPixels,deg2rad(6),46.23*micronsToPixels,3);
[hTranEc{end+1,1},hTranEc{end+1,2},hTranEc{end+1,3},hTranEc{end+1,4},hTranEc{end+1,5},hTranEc{end+1,6},hTranEc{end+1,7},hTranEc{end+1,8},hTranEc{end+1,9},hTranEc{end+1,10},hTranEc{end+1,11},hTranEc{end+1,12},hTranEc{end+1,13},hTranEc{end+1,14},hTranEc{end+1,15},hTranEc{end+1,16},hTranEc{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Ecadhipaths{2},1,[25,20,22,24],5.14*micronsToPixels,0.092,99.59*micronsToPixels,deg2rad(1),41.14*micronsToPixels,3);
[hTranEc{end+1,1},hTranEc{end+1,2},hTranEc{end+1,3},hTranEc{end+1,4},hTranEc{end+1,5},hTranEc{end+1,6},hTranEc{end+1,7},hTranEc{end+1,8},hTranEc{end+1,9},hTranEc{end+1,10},hTranEc{end+1,11},hTranEc{end+1,12},hTranEc{end+1,13},hTranEc{end+1,14},hTranEc{end+1,15},hTranEc{end+1,16},hTranEc{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Ecadhipaths{4},'end',[97,86,71,78],33.7*micronsToPixels,0.156,80.1*micronsToPixels,deg2rad(11),33.7*micronsToPixels,3);

%Overproliferation

[hTranProf{end+1,1},hTranProf{end+1,2},hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{1},1,[4,8,18,05],28.85*micronsToPixels,0.092,162.34*micronsToPixels,deg2rad(2),74.18*micronsToPixels,3);
[hTranProf{end+1,1},hTranProf{end+1,2},hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{1},1,[12,4,3,19],30.54*micronsToPixels,0.092,162.34*micronsToPixels,deg2rad(3),74.18*micronsToPixels,3);
[hTranProf{end+1,1},hTranProf{end+1,2},hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{1},1,[7,2,1,14],20.61*micronsToPixels,0.066,177.04*micronsToPixels,deg2rad(18),70.09*micronsToPixels,3);
[hTranProf{end+1,1},hTranProf{end+1,2},hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{1},'end',[39,38,40,41],35.05*micronsToPixels,0.066,177.04*micronsToPixels,deg2rad(1),70.09*micronsToPixels,3);
[hTranProf{end+1,1},hTranProf{end+1,2},hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{1},'end',[61,62,63,65],19.34*micronsToPixels,0.095,170.33*micronsToPixels,deg2rad(1),77.35*micronsToPixels,3);
[hTranProf{end+1,1},hTranProf{end+1,2},hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{2},1,[6,5,3,10],31.86*micronsToPixels,0.286,207.89*micronsToPixels,deg2rad(6),70.81*micronsToPixels,3);
[hTranProf{end+1,1},hTranProf{end+1,2},hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{2},1,[16,20,12,25],23.91*micronsToPixels,0.134,194.94*micronsToPixels,deg2rad(13),86.06*micronsToPixels,3);
[hTranProf{end+1,1},hTranProf{end+1,2},hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{2},1,[10,8,6,13],46.03*micronsToPixels,0.286,207.89*micronsToPixels,deg2rad(12),70.81*micronsToPixels,3);
[hTranProf{end+1,1},hTranProf{end+1,2},hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{2},1,[20,22,15,31],64.55*micronsToPixels,0.134,194.94*micronsToPixels,deg2rad(9),86.06*micronsToPixels,3);
[hTranProf{end+1,1},hTranProf{end+1,2},hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{2},'end',[41,44,40,45],37.8*micronsToPixels,0.219,158.5*micronsToPixels,deg2rad(1),58.8*micronsToPixels,3);
[hTranProf{end+1,1},hTranProf{end+1,2},hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{2},'end',[60,62,63,59],44.68*micronsToPixels,0.241,210.07*micronsToPixels,deg2rad(10),77.18*micronsToPixels,3);
[hTranProf{end+1,1},hTranProf{end+1,2},hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{3},'end',[20,21,11,29],34.2*micronsToPixels,0.127,167.76*micronsToPixels,deg2rad(5),72.2*micronsToPixels,3);
[hTranProf{end+1,1},hTranProf{end+1,2},hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{3},'end',[16,13,07,28],40.67*micronsToPixels,0.139,169.12*micronsToPixels,deg2rad(3),70.24*micronsToPixels,3);
[hTranProf{end+1,1},hTranProf{end+1,2},hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{3},'end',[8,19,12,24],6.9*micronsToPixels,0.061,124.43*micronsToPixels,deg2rad(4),58.65*micronsToPixels,3);





%% No transition

%WT
[hTranWT{end+1,1},~,hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{1},1,[7,4,2,8],[],0.233,217.49*micronsToPixels,deg2rad(75),82.91*micronsToPixels,2);
[hTranWT{end+1,1},~,hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{1},1,[7,8,2,12],[],0.233,217.49*micronsToPixels,deg2rad(44.7),82.91*micronsToPixels,3);
[hTranWT{end+1,1},~,hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{2},1,[12,14,9,29],[],0.228,221.56*micronsToPixels,deg2rad(18),86.6*micronsToPixels,3);
[hTranWT{end+1,1},~,hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{2},1,[17,11,7,23],[],0.214,232.7*micronsToPixels,deg2rad(80),107.23*micronsToPixels,3);
[hTranWT{end+1,1},~,hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{3},1,[18,15,6,34],[],0.102,242.83*micronsToPixels,deg2rad(10),100.31*micronsToPixels,3);
[hTranWT{end+1,1},~,hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{3},1,[15,25,8,27],[],0.151,269.09*micronsToPixels,deg2rad(66),111.46*micronsToPixels,2);
[hTranWT{end+1,1},~,hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{3},1,[8,14,2,25],[],0.151,269.09*micronsToPixels,deg2rad(13),111.46*micronsToPixels,3);
[hTranWT{end+1,1},~,hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{4},1,[34,36,26,42],[],0.156,173.73*micronsToPixels,deg2rad(6.5),72.81*micronsToPixels,3);
[hTranWT{end+1,1},~,hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{5},1,[20,25,21,26],[],0.254,165.63*micronsToPixels,deg2rad(80.5),63.57*micronsToPixels,2);
[hTranWT{end+1,1},~,hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{5},'end',[82,81,74,84],[],0.373,178.76*micronsToPixels,deg2rad(83.5),57*micronsToPixels,2);
[hTranWT{end+1,1},~,hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{6},1,[26,22,23,27],[],0.284,176.30*micronsToPixels,deg2rad(86.5),65.98*micronsToPixels,2);
[hTranWT{end+1,1},~,hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{6},'end',[83,73,77,67],[],0.180,167.85*micronsToPixels,deg2rad(84),68.65*micronsToPixels,2);
[hTranWT{end+1,1},~,hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{7},'end',[78,79,62,63],[],0.109,140.62*micronsToPixels,deg2rad(7.3),62.9*micronsToPixels,3);
[hTranWT{end+1,1},~,hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{7},'end',[78,63,79,64],[],0.109,140.62*micronsToPixels,deg2rad(63.2),62.9*micronsToPixels,2);
[hTranWT{end+1,1},~,hTranWT{end+1,3},hTranWT{end+1,4},hTranWT{end+1,5},hTranWT{end+1,6},hTranWT{end+1,7},hTranWT{end+1,8},hTranWT{end+1,9},hTranWT{end+1,10},hTranWT{end+1,11},hTranWT{end+1,12},hTranWT{end+1,13},hTranWT{end+1,14},hTranWT{end+1,15},hTranWT{end+1,16},hTranWT{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(WTpaths{7},'end',[78,64,63,65],[],0.109,140.62*micronsToPixels,deg2rad(64.3),62.9*micronsToPixels,2);



%Ecadhi
[hTranEc{end+1,1},~,hTranEc{end+1,3},hTranEc{end+1,4},hTranEc{end+1,5},hTranEc{end+1,6},hTranEc{end+1,7},hTranEc{end+1,8},hTranEc{end+1,9},hTranEc{end+1,10},hTranEc{end+1,11},hTranEc{end+1,12},hTranEc{end+1,13},hTranEc{end+1,14},hTranEc{end+1,15},hTranEc{end+1,16},hTranEc{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Ecadhipaths{3},1,[12,14,15,16],[],0.299,78.25*micronsToPixels,deg2rad(58),27.47*micronsToPixels,2);
[hTranEc{end+1,1},~,hTranEc{end+1,3},hTranEc{end+1,4},hTranEc{end+1,5},hTranEc{end+1,6},hTranEc{end+1,7},hTranEc{end+1,8},hTranEc{end+1,9},hTranEc{end+1,10},hTranEc{end+1,11},hTranEc{end+1,12},hTranEc{end+1,13},hTranEc{end+1,14},hTranEc{end+1,15},hTranEc{end+1,16},hTranEc{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Ecadhipaths{4},1,[12,13,2,24],[],0.181, 75.43*micronsToPixels,deg2rad(24.5),32.89*micronsToPixels,3);
[hTranEc{end+1,1},~,hTranEc{end+1,3},hTranEc{end+1,4},hTranEc{end+1,5},hTranEc{end+1,6},hTranEc{end+1,7},hTranEc{end+1,8},hTranEc{end+1,9},hTranEc{end+1,10},hTranEc{end+1,11},hTranEc{end+1,12},hTranEc{end+1,13},hTranEc{end+1,14},hTranEc{end+1,15},hTranEc{end+1,16},hTranEc{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Ecadhipaths{4},1,[12,18,5,24],[],0.181,75.43*micronsToPixels,deg2rad(58),32.89*micronsToPixels,2);
% [hTranEc{end+1,1},~,hTranEc{end+1,3},hTranEc{end+1,4},hTranEc{end+1,5},hTranEc{end+1,6},hTranEc{end+1,7},hTranEc{end+1,8},hTranEc{end+1,9},hTranEc{end+1,10},hTranEc{end+1,11},hTranEc{end+1,12},hTranEc{end+1,13},hTranEc{end+1,14},hTranEc{end+1,15},hTranEc{end+1,16},hTranEc{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Ecadhipaths{4},1,[28,18,5,24],[],0.152, 82.37*micronsToPixels,deg2rad(83),35.47*micronsToPixels,3);
[hTranEc{end+1,1},~,hTranEc{end+1,3},hTranEc{end+1,4},hTranEc{end+1,5},hTranEc{end+1,6},hTranEc{end+1,7},hTranEc{end+1,8},hTranEc{end+1,9},hTranEc{end+1,10},hTranEc{end+1,11},hTranEc{end+1,12},hTranEc{end+1,13},hTranEc{end+1,14},hTranEc{end+1,15},hTranEc{end+1,16},hTranEc{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Ecadhipaths{4},1,[28,22,6,31],[],0.152, 82.37*micronsToPixels,deg2rad(30),35.47*micronsToPixels,3);

%Overprolifeation

[hTranProf{end+1,1},~,hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{1},1,[8,21,13,22],[],0.092,176.51*micronsToPixels,deg2rad(62),78.99*micronsToPixels,2);
[hTranProf{end+1,1},~,hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{1},1,[16,24,15,25],[],0.095,170.33*micronsToPixels,deg2rad(73),77.35*micronsToPixels,2);
[hTranProf{end+1,1},~,hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{1},'end',[41,42,43,46],[],0.091,168.59*micronsToPixels,deg2rad(81),71.1*micronsToPixels,2);
[hTranProf{end+1,1},~,hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{1},'end',[55,56,54,53],[],0.092,176.51*micronsToPixels,deg2rad(6),78.99*micronsToPixels,3);
[hTranProf{end+1,1},~,hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{1},'end',[46,50,49,48],[],0.092,162.34*micronsToPixels,deg2rad(12.5),74.18*micronsToPixels,3);
[hTranProf{end+1,1},~,hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{2},1,[22,28,19,30],[],0.145,189.96*micronsToPixels,deg2rad(82.5),79.56*micronsToPixels,2);
[hTranProf{end+1,1},~,hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{2},1,[19,29,24,28],[],0.145,189.96*micronsToPixels,deg2rad(60),79.56*micronsToPixels,2);
[hTranProf{end+1,1},~,hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{2},'end',[66,69,68,67],[],0.134,194.94*micronsToPixels,deg2rad(78),86.06*micronsToPixels,2);
[hTranProf{end+1,1},~,hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{2},'end',[40,46,42,44],[],0.219,158.5*micronsToPixels,deg2rad(74),58.8*micronsToPixels,2);
[hTranProf{end+1,1},~,hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{3},'end',[6,2,1,17],[],0.119,155.92*micronsToPixels,deg2rad(83.5),70.59*micronsToPixels,2);
[hTranProf{end+1,1},~,hTranProf{end+1,3},hTranProf{end+1,4},hTranProf{end+1,5},hTranProf{end+1,6},hTranProf{end+1,7},hTranProf{end+1,8},hTranProf{end+1,9},hTranProf{end+1,10},hTranProf{end+1,11},hTranProf{end+1,12},hTranProf{end+1,13},hTranProf{end+1,14},hTranProf{end+1,15},hTranProf{end+1,16},hTranProf{end+1,17}]=recalculateCentroidsGlandsHeightTranPrediction(Prolifpaths{3},'end',[26,20,14,34],[],0.131,160.71*micronsToPixels,deg2rad(9),67.83*micronsToPixels,3);



clearvars -except hTranWT hTranEc hTranProf

hTranWT=cell2table(hTranWT);
hTranWT.Properties.VariableNames{1} = 'motif';
hTranWT.Properties.VariableNames{2} = 'hMeasurements';
hTranWT.Properties.VariableNames{3} = 'hPredict';
hTranWT.Properties.VariableNames{4} = 'hCell';
hTranWT.Properties.VariableNames{5} = 'Degrees';
hTranWT.Properties.VariableNames{6} = 'Curvature';
hTranWT.Properties.VariableNames{7} = 'L12';
hTranWT.Properties.VariableNames{8} = 'L34';
hTranWT.Properties.VariableNames{9} = 'L12PostCurvature';
hTranWT.Properties.VariableNames{10} = 'L34PostCurvature';
hTranWT.Properties.VariableNames{11} = 'CoordA';
hTranWT.Properties.VariableNames{12} = 'CoordB';
hTranWT.Properties.VariableNames{13} = 'LEdgeTransition';
hTranWT.Properties.VariableNames{14} = 'Coord1';
hTranWT.Properties.VariableNames{15} = 'Coord2';
hTranWT.Properties.VariableNames{16} = 'Coord3';
hTranWT.Properties.VariableNames{17} = 'Coord4';


hTranEc=cell2table(hTranEc);
hTranEc.Properties.VariableNames{1} = 'motif';
hTranEc.Properties.VariableNames{2} = 'hMeasurements';
hTranEc.Properties.VariableNames{3} = 'hPredict';
hTranEc.Properties.VariableNames{4} = 'hCell';
hTranEc.Properties.VariableNames{5} = 'Degrees';
hTranEc.Properties.VariableNames{6} = 'Curvature';
hTranEc.Properties.VariableNames{7} = 'L12';
hTranEc.Properties.VariableNames{8} = 'L34';
hTranEc.Properties.VariableNames{9} = 'L12PostCurvature';
hTranEc.Properties.VariableNames{10} = 'L34PostCurvature';
hTranEc.Properties.VariableNames{11} = 'CoordA';
hTranEc.Properties.VariableNames{12} = 'CoordB';
hTranEc.Properties.VariableNames{13} = 'LEdgeTransition';
hTranEc.Properties.VariableNames{14} = 'Coord1';
hTranEc.Properties.VariableNames{15} = 'Coord2';
hTranEc.Properties.VariableNames{16} = 'Coord3';
hTranEc.Properties.VariableNames{17} = 'Coord4';

hTranProf=cell2table(hTranProf);
hTranProf.Properties.VariableNames{1} = 'motif';
hTranProf.Properties.VariableNames{2} = 'hMeasurements';
hTranProf.Properties.VariableNames{3} = 'hPredict';
hTranProf.Properties.VariableNames{4} = 'hCell';
hTranProf.Properties.VariableNames{5} = 'Degrees';
hTranProf.Properties.VariableNames{6} = 'Curvature';
hTranProf.Properties.VariableNames{7} = 'L12';
hTranProf.Properties.VariableNames{8} = 'L34';
hTranProf.Properties.VariableNames{9} = 'L12PostCurvature';
hTranProf.Properties.VariableNames{10} = 'L34PostCurvature';
hTranProf.Properties.VariableNames{11} = 'CoordA';
hTranProf.Properties.VariableNames{12} = 'CoordB';
hTranProf.Properties.VariableNames{13} = 'LEdgeTransition';
hTranProf.Properties.VariableNames{14} = 'Coord1';
hTranProf.Properties.VariableNames{15} = 'Coord2';
hTranProf.Properties.VariableNames{16} = 'Coord3';
hTranProf.Properties.VariableNames{17} = 'Coord4';
