function [ Layers ] = LayerSeparator( photo_Path,name,initialFrame, maxFrame )


%%Variables

% photo_Path='C:\Users\tinaf\OneDrive\Documentos\Departamento\Epithelia3D\Prueba';
% name='50epib_2_z0';
% initialFrame=6;
% maxFrame=7;
nameComplete=cell(maxFrame,1);
photoPath=cell(maxFrame,1);
nameNew=cell(maxFrame,1);
centroids=cell(maxFrame,1);
pixel=cell(maxFrame,1);
in=cell(maxFrame,1);
on=cell(maxFrame,1);
Layers=cell(80,1);
j=1; %Variable que aumenta con el n�mero de capas
w=[];
maskBW=cell(maxFrame,1);
Label=cell(maxFrame,1);

for i=initialFrame:maxFrame %Variable que corresponde con el n� de im�genes (frame)
   
   %Lectura de las im�genes
   nameComplete{i}= [name sprintf('%02d',i) '_c002.tif'];
   photoPath{i}=[photo_Path '\' nameComplete{i}];
   nameNew{i}=[photo_Path '\' name sprintf('%02d',i) 'centroid_c002'];
   
   
   [centroids{i,1}, pixel{i,1}, maskBW{i,1}]=Centroid(photoPath{i}, nameNew{i});
   Label{i}=bwlabel(maskBW{i,1},8);
   
   
   if i==initialFrame
    xPixel{i,1}=pixel{i,1}(:, 1);
    yPixel{i,1}=pixel{i,1}(:, 2);
    xCentroid{i,1}=centroids{i,1}(:, 1);
    yCentroid{i,1}=centroids{i,1}(:, 2);
    
    [k]=boundary(xPixel{i,1},yPixel{i,1});
    
    [in{i},on{i}] = inpolygon(xCentroid{i,1},yCentroid{i,1},xPixel{i,1}(k),yPixel{i,1}(k));
    Layers{j}=[xPixel{i,1},yPixel{i,1}]; %FRAME 6
   
   
   else
       
%     xPixel{i-1,1}=pixel{i-1,1}(:, 1);
%     yPixel{i-1,1}=pixel{i-1,1}(:, 2);
    xPixel{i,1}=pixel{i,1}(:, 1);
    yPixel{i,1}=pixel{i,1}(:, 2);

    xQuery{i,1}=centroids{i,1}(:, 1);
    yQuery{i,1}=centroids{i,1}(:, 2);
    
    [k]=boundary(xPixel{i-1,1},yPixel{i-1,1});
   
    [in{i},on{i}] = inpolygon(xQuery{i,1},yQuery{i,1},xPixel{i-1,1}(k),yPixel{i-1,1}(k));
    
%    figure
%    imshow(photoPath{i});
%    hold on
%    plot(xPixel{i-1,1}(k),yPixel{i-1,1}(k),'LineWidth',2) % polygon
%    axis equal
%    plot(xPixel{i-1,1},yPixel{i-1,1},'w*') % PostPoints 
%    plot(xQuery{i,1}(in{i}), yQuery{i,1}(in{i}),'g+') % points inside
%    plot(xQuery{i,1}(~in{i}),yQuery{i,1}(~in{i}),'bo') % points outside
%    hold off
   
   k=size(centroids{i}(:, 1));
   K=k(1,1); %El n� de centroides que hay, que es el mismo que filas tiene la variable 'in'
   
 
   
    for n=1:K
        if in{i,1}(n)==0      
            w=[xPixel{i,1}(n), yPixel{i,1}(n)];
            Layers = vertcat(Layers{j},w);
            disp('DONT');
        elseif in{i,1}(n)==1 && Label{i}~=Label{i-1} 
            j=j+1;
            disp('NANAI');
%           xQuery{i}(in{i}), yQuery{i}(in{i})
        else
            disp('WHY?T.T');
        end
    end
  end
   
end


end

