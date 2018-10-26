function [finalImage,validCells,noValidCells] = getFinalImageAndNoValidCells(layerImage,c)

    labelMask=zeros(size(layerImage));
    perimMask=false(size(layerImage));
    smallCellsImg = zeros(size(layerImage));
    
    %open area
    %This is really doing nothing
    areaValid=bwareaopen(layerImage,50);
    layerImage(~areaValid)=0;
    %sum(sum(~areaValid & layerImage~=0))
    
    %% delete strange shapes and get perimeters for watershed
    cellsLayer=unique(layerImage);
    cellsLayer=cellsLayer(cellsLayer~=0);
    
    for nCell = cellsLayer'
       
        mask = zeros(size(labelMask));
        mask(layerImage == nCell) = 1;
        mask = bwareaopen(mask,5);
        %mask = imfill(mask, 'holes');
        
        maskDilated = imdilate(mask,strel('disk',3));
        maskEroded = imerode(maskDilated,strel('disk',2));
        if sum(mask(:)) <= 400
            maskEroded = imerode(maskDilated,strel('disk',2));
            smallCellsImg(maskEroded) = 1;
        end
        labelMask(maskEroded)=nCell;
        maskErodedPerim = bwperim(maskEroded);
        % It is not the perim the zone of 0s or the border
        dilatedSurroundingCells = imdilate(layerImage~=nCell, strel('disk', 1));
        perimMask(maskErodedPerim & dilatedSurroundingCells)=1;
    end
    labelMaskPerim=labelMask;
    zerosLabelMask = labelMask==0;
    zerosLabelMask = bwareaopen(zerosLabelMask,70,4);
    zerosLabelMask = bwfill(zerosLabelMask, 'holes');
    zerosLabelMask = ~bwfill(zerosLabelMask == 0, 'holes');
    
%     figure;imshow(labelMask+1, c)
%     figure;imshow(zerosLabelMask)
    labelMaskPerim(perimMask)=0;
%     figure;imshow(labelMaskPerim,c)
    validArea=bwareaopen(labelMaskPerim,50,4);
    labelMaskPerim(~validArea & smallCellsImg == 0)=0;
    
    %% Watershed
    maskDist=bwdist(labelMaskPerim>0);
    maskWater=watershed(maskDist,4);
%     maskDist=bwdist(maskWater>0);
%     maskWater=watershed(maskDist,4);
    %figure;imshow(maskWater,c)
    maskWater(zerosLabelMask==1)=0;
    validArea=bwareaopen(maskWater,10,4);
    maskWater(~validArea & smallCellsImg == 0)=0;

    %figure;imshow(maskWater,c)
    
    %% relabel cells with original labels
    centroids = regionprops(maskWater,'Centroid');
    centroids = round(cat(1,centroids.Centroid));
    cellsWater = unique(maskWater);
    cellsWater=cellsWater(cellsWater~=0);
    
    finalImage=zeros(size(maskWater));
    dilatedMask = zeros(size(maskWater));
    for nCell = cellsWater'
        dilatedMask(centroids(nCell,2),centroids(nCell,1)) = 1;
        valuesSurroundingCentroid = labelMask(imdilate(dilatedMask, strel('disk', 3))> 0);
        mostFrequentValue = mode(valuesSurroundingCentroid);
        finalImage(maskWater==nCell) = mostFrequentValue;
        
        dilatedMask(centroids(nCell,2),centroids(nCell,1)) = 0;
    end
%     figure;imshow(finalImage+1,c)
    
    %% Unifying splitted near cells
    connected4 = [0 1 0; 1 0 1; 0 1 0];
    
    edgePixels = find(finalImage == 0 & zerosLabelMask == 0);
%     hold on;
    for edgePixel = edgePixels'
        dilatedMask(edgePixel) = 1;
        values4Connected = finalImage(imdilate(dilatedMask, connected4)>0);
        values4ConnectedUnique = unique(values4Connected);
        values4ConnectedUnique(values4ConnectedUnique==0) = [];
        if length(values4ConnectedUnique) == 1
            finalImage(edgePixel) = values4ConnectedUnique;
%             [x,y] = ind2sub(size(finalImage), edgePixel);
%             plot(y, x, '*r')
        end
        dilatedMask(edgePixel) = 0;
    end

    %% Get valid & no valid Cells
    maskNoValidCell=imdilate(imdilate(finalImage>0,strel('disk',2))==0,strel('disk',5));
    noValidCells = unique(finalImage(maskNoValidCell));   
    borderCells = unique([unique(finalImage(1:2,:));unique(finalImage(end-1:end,:))]);
    noValidCells = unique([noValidCells;borderCells]);  
    
    validCells = setdiff(unique(finalImage),noValidCells);
    
    noValidCells = noValidCells(noValidCells~=0);
%     figure;imshow(ismember(finalImage,validCells))

    
    
end