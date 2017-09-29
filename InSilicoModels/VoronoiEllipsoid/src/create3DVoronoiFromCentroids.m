function [ img3DLabelled, ellipsoidInfo, newOrderOfCentroids ] = create3DVoronoiFromCentroids( centroids,  augmentedCentroids, cellHeight, ellipsoidInfo, outputDir)
%CREATE3DVORONOIFROMCENTROIDS Summary of this function goes here
%   Detailed explanation goes here
    
    ellipsoidInfo.resolutionFactor = 20;

    xOffset = abs(min(augmentedCentroids(:, 1)));
    ellipsoidInfo.xOffset = xOffset;
    centroids(:, 1) = centroids(:, 1) + xOffset;
    augmentedCentroids(:, 1) = augmentedCentroids(:, 1) + xOffset;
    
    yOffset = abs(min(augmentedCentroids(:, 2)));
    ellipsoidInfo.yOffset = yOffset;
    centroids(:, 2) = centroids(:, 2) + yOffset;
    augmentedCentroids(:, 2) = augmentedCentroids(:, 2) + yOffset;
    
    zOffset = abs(min(augmentedCentroids(:, 3)));
    ellipsoidInfo.zOffset = zOffset;
    centroids(:, 3) = centroids(:, 3) + zOffset;
    augmentedCentroids(:, 3) = augmentedCentroids(:, 3) + zOffset;

    centroids = round(centroids * ellipsoidInfo.resolutionFactor) + 1;
    augmentedCentroids = round(augmentedCentroids * ellipsoidInfo.resolutionFactor) + 1;
    
    img3D = zeros(max(augmentedCentroids));

    [allXs, allYs, allZs] = findND(img3D == 0);
    
    %Removing invalid areas
    disp('Removing invalid areas')
    [ validPxs, ~, ~ ] = getValidPixels(allXs, allYs, allZs, ellipsoidInfo, cellHeight);
    
    for numCentroid = 1:size(centroids, 1)
        img3D = Drawline3D(img3D, centroids(numCentroid, 1), centroids(numCentroid, 2), centroids(numCentroid, 3), augmentedCentroids(numCentroid, 1), augmentedCentroids(numCentroid, 2), augmentedCentroids(numCentroid, 3), numCentroid);
    end
    
    
    imgWithDistances = bwdist(img3D);

    disp('Reconstruct voronoi cells')
    img3DLabelled = watershed(imgWithDistances, 26);
    
    %Removing invalid regions of img3DLabelled
    img3DLabelled(validPxs == 0) = 0;

    colours = colorcube(size(centroids, 1));
    newOrderOfCentroids = zeros(size(centroids, 1), 1);
%     figure;
    for numSeed = 1:size(centroids, 1)
        newOrderOfCentroids(numSeed) = img3DLabelled(centroids(numSeed, 1), centroids(numSeed, 2), centroids(numSeed, 3));
%         perimRegionActual = bwperim(regionActual);
%         [x, y, z] = findND(perimRegionActual);
%         cellFigure = alphaShape(x, y, z);
%         plot(cellFigure, 'FaceColor', colours(numSeed, :), 'EdgeColor', 'none', 'AmbientStrength', 0.3, 'FaceAlpha', 0.7);
%         hold on;
    end
    
    ellipsoidInfo.centroids = augmentedCentroids(newOrderOfCentroids, :);
    toc
    save(strcat(outputDir, '\voronoi', date, '.mat'), 'img3DLabelled', 'seedsInfo', 'ellipsoidInfo', '-v7.3');
    %savefig(strcat(outputDir, '\voronoi_', date, '.fig'));
end

