%%  Display and save colored image sequence
function display_colored_glands_by_label(folder)

load(['..\..\Segmented images data\' folder '\Label_sequence.mat'],'Seq_Img_L')

    for i=1:size(Seq_Img_L,1)

        %% Display images with visible label
            s=regionprops(Seq_Img_L{i,1},'Centroid');
           
            fig=figure;
            
            mask=Seq_Img_L{i,1};
            mask(mask==0)=300;

            imshow(mask,colorcube (300))

            for k=1:numel(s)
                c=s(k).Centroid;
                text(c(1),c(2),sprintf('%d',k),'Color','blue','HorizontalAlignment','center','VerticalAlignment','middle');
            end
            

            print('-f1','-dbmp',['..\..\Segmented images data\' folder '\Skel_Labelled_' num2str(i) '.bmp'])
            
            close all
    end

end