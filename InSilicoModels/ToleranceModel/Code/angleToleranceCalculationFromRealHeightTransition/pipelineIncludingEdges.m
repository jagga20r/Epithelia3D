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


micronsToPixels=1024/631.02; %microns*(pixels/microns)= pixels;

% angleScaledWT=[];
% angleWithoutScaledWT=[];
% 
% %[angleScaled,angleWithoutScaled]=mainLocalAngleFromRealHeightTransitionIncludingEdgesIncludingEdges(pathStructure,frame,cellsGroup,hTransition,curvature,frameTran,pairToCheck)
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{1},1,[15,18,13,21],72.9*micronsToPixels,0.204,3,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{1},'end',[57,59,54,12],58*micronsToPixels,0.217,18,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{1},'end',[60,62,61,69],66.39*micronsToPixels,0.204,18,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{1},'end',[68,67,22,58],57.2*micronsToPixels,0.192,20,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{2},1,[7,5,17,3],79.26*micronsToPixels,0.214,12,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{2},'end',[50,53,38,43],73.9*micronsToPixels,0.240,22,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{2},'end',[51,49,3,42],94.61*micronsToPixels,0.214,23,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{3},'end',[79,73,75,56],91.58*micronsToPixels,0.152,25,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{3},'end',[64,69,68,42],93.86*micronsToPixels,0.151,22,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{4},1,[21,29,18,37],37.97*micronsToPixels,0.261,7,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{4},'end',[78,74,80,53],41.21*micronsToPixels,0.256,23,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{4},'end',[71,69,70,56],34.9*micronsToPixels,0.213,26,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{5},1,[11,16,12,17],50.6*micronsToPixels,0.243,9,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{5},1,[16,20,15,24],40.85*micronsToPixels,0.197,5,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{5},1,[25,31,28,29],52.93*micronsToPixels,0.373,8,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{5},'end',[79,77,3,78],52.38*micronsToPixels,0.235,19,'loss'); %rareeee motif
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{5},'end',[84,87,83,64],45.41*micronsToPixels,0.254,21,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{6},3,[23,16,17,21],38.14*micronsToPixels,0.180,6,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{6},'end',[69,65,46,64],53.53*micronsToPixels,0.203,22,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{6},'end',[65,83,66,56],39.23*micronsToPixels,0.180,26,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{6},'end',[73,75,78,74],49.49*micronsToPixels,0.284,23,'loss');
% [angleScaledWT(end+1,1),angleWithoutScaledWT(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(WTpaths{7},1,[34,32,22,40],35.94*micronsToPixels,0.109,7,'loss');
% 
% 
% %Ecadhi
% angleScaledEcadhi=[];
% angleWithoutScaledEcadhi=[];
% 
% [angleScaledEcadhi(end+1,1),angleWithoutScaledEcadhi(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(Ecadhipaths{1},1,[11,7,9,10],12.05*micronsToPixels,0.218,2,'loss');
% [angleScaledEcadhi(end+1,1),angleWithoutScaledEcadhi(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(Ecadhipaths{1},1,[24,27,25,29],25.44*micronsToPixels,0.19,5,'loss');
% [angleScaledEcadhi(end+1,1),angleWithoutScaledEcadhi(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(Ecadhipaths{1},'end',[85,75,83,43],30.3*micronsToPixels,0.236,13,'loss');
% [angleScaledEcadhi(end+1,1),angleWithoutScaledEcadhi(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(Ecadhipaths{1},'end',[89,88,47,45],72.9*micronsToPixels,0.246,15,'loss');
% [angleScaledEcadhi(end+1,1),angleWithoutScaledEcadhi(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(Ecadhipaths{2},1,[21,17,16,23],41.09*micronsToPixels,0.157,5,'loss');
% [angleScaledEcadhi(end+1,1),angleWithoutScaledEcadhi(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(Ecadhipaths{2},1,[25,20,22,24],5.14*micronsToPixels,0.092,2,'loss');
% [angleScaledEcadhi(end+1,1),angleWithoutScaledEcadhi(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(Ecadhipaths{4},'end',[97,86,71,78],33.7*micronsToPixels,0.156,14,'loss');
% 
% 
% %CultE
% angleScaledCultEp=[];
% angleWithoutScaledCultEp=[];
% %Now we don't apply curvature. We only apply proportion of ratios
% [angleScaledCultEp(end+1,1),angleWithoutScaledCultEp(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(CultEpaths{1},1,[5,13,8,11],6.22*micronsToPixels,sqrt(0.358),4,'loss');
% [angleScaledCultEp(end+1,1),angleWithoutScaledCultEp(end+1,1)]=mainLocalAngleFromRealHeightTransitionIncludingEdges(CultEpaths{2},1,[6,8,4,9],3.54*micronsToPixels,sqrt(0.242),4,'gain');
% 
% % 
% 
% %mean, median and max
% meanAngleScaledWT=mean(angleScaledWT);
% meanAngleWithoutScaledWT=mean(angleWithoutScaledWT);
% meanAngleScaledCultEp=mean(angleScaledCultEp);
% meanAngleWithoutScaledCultEp=mean(angleWithoutScaledCultEp);
% meanAngleScaledEcadhi=mean(angleScaledEcadhi);
% meanAngleWithoutScaledEcadhi=mean(angleWithoutScaledEcadhi);
% 
% 
% stdAngleScaledWT=std(angleScaledWT);
% stdAngleWithoutScaledWT=std(angleWithoutScaledWT);
% stdAngleScaledCultEp=std(angleScaledCultEp);
% stdAngleWithoutScaledCultEp=std(angleWithoutScaledCultEp);
% stdAngleScaledEcadhi=std(angleScaledEcadhi);
% stdAngleWithoutScaledEcadhi=std(angleWithoutScaledEcadhi);
% 
% 
% maxAngleScaledWT=max(angleScaledWT);
% maxAngleWithoutScaledWT=max(angleWithoutScaledWT);
% maxAngleScaledCultEp=max(angleScaledCultEp);
% maxAngleWithoutScaledCultEp=max(angleWithoutScaledCultEp);
% maxAngleScaledEcadhi=max(angleScaledEcadhi);
% maxAngleWithoutScaledEcadhi=max(angleWithoutScaledEcadhi);
% 
% medianAngleScaledWT=median(angleScaledWT);
% medianAngleWithoutScaledWT=median(angleWithoutScaledWT);
% medianAngleScaledCultEp=median(angleScaledCultEp);
% medianAngleWithoutScaledCultEp=median(angleWithoutScaledCultEp);
% medianAngleScaledEcadhi=median(angleScaledEcadhi);
% medianAngleWithoutScaledEcadhi=median(angleWithoutScaledEcadhi);

path2Load=[rootPath 'Salivary Glands\Tolerance model\Data\checkingHeightOfTransitionFixing2Points\anglesMeasurementsIncludingEdges.mat'];
%save(path2Load,'maxAngleScaledWT','maxAngleWithoutScaledWT','maxAngleScaledCultEp','maxAngleWithoutScaledCultEp','maxAngleScaledEcadhi','maxAngleWithoutScaledEcadhi','stdAngleScaledWT','stdAngleWithoutScaledWT','stdAngleScaledCultEp','stdAngleWithoutScaledCultEp','stdAngleScaledEcadhi','stdAngleWithoutScaledEcadhi','meanAngleScaledWT','meanAngleWithoutScaledWT','meanAngleScaledCultEp','meanAngleWithoutScaledCultEp','meanAngleScaledEcadhi','meanAngleWithoutScaledEcadhi','medianAngleScaledWT','medianAngleWithoutScaledWT','medianAngleScaledCultEp','medianAngleWithoutScaledCultEp','medianAngleScaledEcadhi','medianAngleWithoutScaledEcadhi')
load(path2Load)
% % No Transitions
%[hTransitionScaledMean,hTransitionScaledMean2,hTransitionWithoutScaledMean,hTransitionWithoutScaledMean2,hTransitionScaledMax,hTransitionScaledMax2,hTransitionWithoutScaledMax,hTransitionWithoutScaledMax2,hTransitionScaledMedian,hTransitionScaledMedian2,hTransitionWithoutScaledMedian,hTransitionWithoutScaledMedian2,resultOfComparisonMean,resultOfComparisonMax,resultOfComparisonMedian] = mainCheckPredictedHeightIncludingEdges(pathStructure,frame,cellsGroup,hCell,curvature,meanAngleScaled,meanAngleScaled2,meanAngleWithoutScaled,meanAngleWithoutScaled2,maxAngleScaled,maxAngleScaled2,maxAngleWithoutScaled,maxAngleWithoutScaled2,medianAngleScaled,medianAngleScaled2,medianAngleWithoutScaled,medianAngleWithoutScaled2)

%WT

% [resultOfCompMean,resultOfCompMax,resultOfCompMedian]=mainCheckPredictedHeightIncludingEdges(WTpaths{5},'end',[82,81,74,84],57*micronsToPixels,0.373,meanAngleScaledWT,meanAngleWithoutScaledWT,maxAngleScaledWT,maxAngleWithoutScaledWT,medianAngleScaledWT,medianAngleWithoutScaledWT);
% [resultOfCompMean,resultOfCompMax,resultOfCompMedian]=mainCheckPredictedHeightIncludingEdges(WTpaths{6},1,[26,22,23,27],65.98*micronsToPixels,0.284,meanAngleScaledWT,meanAngleWithoutScaledWT,maxAngleScaledWT,maxAngleWithoutScaledWT,medianAngleScaledWT,medianAngleWithoutScaledWT);
% [resultOfCompMean,resultOfCompMax,resultOfCompMedian]=mainCheckPredictedHeightIncludingEdges(WTpaths{7},'end',[78,79,62,63],62.9*micronsToPixels,0.109,meanAngleScaledWT,meanAngleWithoutScaledWT,maxAngleScaledWT,maxAngleWithoutScaledWT,medianAngleScaledWT,medianAngleWithoutScaledWT);
% [resultOfCompMean,resultOfCompMax,resultOfCompMedian]=mainCheckPredictedHeightIncludingEdges(WTpaths{7},'end',[78,63,79,64],62.9*micronsToPixels,0.109,meanAngleScaledWT,meanAngleWithoutScaledWT,maxAngleScaledWT,maxAngleWithoutScaledWT,medianAngleScaledWT,medianAngleWithoutScaledWT);
% [resultOfCompMean,resultOfCompMax,resultOfCompMedian]=mainCheckPredictedHeightIncludingEdges(WTpaths{7},'end',[78,64,63,65],62.9*micronsToPixels,0.109,meanAngleScaledWT,meanAngleWithoutScaledWT,maxAngleScaledWT,maxAngleWithoutScaledWT,medianAngleScaledWT,medianAngleWithoutScaledWT);


% 
% %Ecadhi
% [resultOfCompMean,resultOfCompMax,resultOfCompMedian]=mainCheckPredictedHeightIncludingEdges(Ecadhipaths{3},1,[12,14,15,16],27.47*micronsToPixels,0.299,meanAngleScaledEcadhi,meanAngleWithoutScaledEcadhi,maxAngleScaledEcadhi,maxAngleWithoutScaledEcadhi,medianAngleScaledEcadhi,medianAngleWithoutScaledEcadhi);
% [resultOfCompMean,resultOfCompMax,resultOfCompMedian]=mainCheckPredictedHeightIncludingEdges(Ecadhipaths{4},1,[12,13,2,24],32.89*micronsToPixels,0.181,meanAngleScaledEcadhi,meanAngleWithoutScaledEcadhi,maxAngleScaledEcadhi,maxAngleWithoutScaledEcadhi,medianAngleScaledEcadhi,medianAngleWithoutScaledEcadhi);
% [resultOfCompMean,resultOfCompMax,resultOfCompMedian]=mainCheckPredictedHeightIncludingEdges(Ecadhipaths{4},1,[12,18,5,24],32.89*micronsToPixels,0.181,meanAngleScaledEcadhi,meanAngleWithoutScaledEcadhi,maxAngleScaledEcadhi,maxAngleWithoutScaledEcadhi,medianAngleScaledEcadhi,medianAngleWithoutScaledEcadhi);
% [resultOfCompMean,resultOfCompMax,resultOfCompMedian]=mainCheckPredictedHeightIncludingEdges(Ecadhipaths{4},1,[28,18,5,24],35.47*micronsToPixels,0.152,meanAngleScaledEcadhi,meanAngleWithoutScaledEcadhi,maxAngleScaledEcadhi,maxAngleWithoutScaledEcadhi,medianAngleScaledEcadhi,medianAngleWithoutScaledEcadhi);
% [resultOfCompMean,resultOfCompMax,resultOfCompMedian]=mainCheckPredictedHeightIncludingEdges(Ecadhipaths{4},1,[28,22,6,31],35.47*micronsToPixels,0.152,meanAngleScaledEcadhi,meanAngleWithoutScaledEcadhi,maxAngleScaledEcadhi,maxAngleWithoutScaledEcadhi,medianAngleScaledEcadhi,medianAngleWithoutScaledEcadhi);
% 
% 
% 
% %CultE
% [resultOfCompMean,resultOfCompMax,resultOfCompMedian]=mainCheckPredictedHeightIncludingEdges(CultEpaths{1},42,[28,31,30,29],10.74*micronsToPixels,sqrt(0.358),meanAngleScaledCultEp,meanAngleWithoutScaledCultEp,maxAngleScaledCultEp,maxAngleWithoutScaledCultEp,medianAngleScaledCultEp,medianAngleWithoutScaledCultEp);
% [resultOfCompMean,resultOfCompMax,resultOfCompMedian]=mainCheckPredictedHeightIncludingEdges(CultEpaths{2},'end',[32,31,30,29],9.92*micronsToPixels,sqrt(0.242),meanAngleScaledCultEp,meanAngleWithoutScaledCultEp,maxAngleScaledCultEp,maxAngleWithoutScaledCultEp,medianAngleScaledCultEp,medianAngleWithoutScaledCultEp);
% [resultOfCompMean,resultOfCompMax,resultOfCompMedian]=mainCheckPredictedHeightIncludingEdges(CultEpaths{2},'end',[32,20,23,33],9.92*micronsToPixels,sqrt(0.242),meanAngleScaledCultEp,meanAngleWithoutScaledCultEp,maxAngleScaledCultEp,maxAngleWithoutScaledCultEp,medianAngleScaledCultEp,medianAngleWithoutScaledCultEp);
% [resultOfCompMean,resultOfCompMax,resultOfCompMedian]=mainCheckPredictedHeightIncludingEdges(CultEpaths{2},'end',[32,23,30,29],9.92*micronsToPixels,sqrt(0.242),meanAngleScaledCultEp,meanAngleWithoutScaledCultEp,maxAngleScaledCultEp,maxAngleWithoutScaledCultEp,medianAngleScaledCultEp,medianAngleWithoutScaledCultEp);
% [resultOfCompMean,resultOfCompMax,resultOfCompMedian]=mainCheckPredictedHeightIncludingEdges(CultEpaths{2},'end',[32,20,31,33],9.92*micronsToPixels,sqrt(0.242),meanAngleScaledCultEp,meanAngleWithoutScaledCultEp,maxAngleScaledCultEp,maxAngleWithoutScaledCultEp,medianAngleScaledCultEp,medianAngleWithoutScaledCultEp);
% [resultOfCompMean,resultOfCompMax,resultOfCompMedian]=mainCheckPredictedHeightIncludingEdges(CultEpaths{3},22,[14,15,17,16],6.79*micronsToPixels,sqrt(0.332),meanAngleScaledCultEp,meanAngleWithoutScaledCultEp,maxAngleScaledCultEp,maxAngleWithoutScaledCultEp,medianAngleScaledCultEp,medianAngleWithoutScaledCultEp);
%  

clearvars -except resultOfCompMax resultOfCompMean resultOfCompMedian