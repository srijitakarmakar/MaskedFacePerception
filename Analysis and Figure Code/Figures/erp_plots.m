% use the 'Electrode LUT.pdf' look-up table to correctly cluster the electrodes

% clustering PO3-PO7 and PO4-PO8
figure()
 % === PO8-PO4 ===
        f1 = strcat('unmasked_familiar_all_only_epochrej_new.mat');
        A = load(f1);
        %data1 = A.Data_4;
        data1 = A.UM_Fa_all;
        data1a = data1(59,:,:);
        data1b = data1(53,:,:);
        Data1 = cat(3,data1a,data1b);
        
        f2 = strcat('unmasked_unfamiliar_all_only_epochrej_new.mat');
        B = load(f2);
        %data2 = B.Data_6;
        data2 = B.UM_UF_all;
        data2a = data2(59,:,:);
        data2b = data2(53,:,:);
        Data2 = cat(3,data2a,data2b);
        
        f3 = strcat('unmasked_famous_all_only_epochrej_new.mat');
        C = load(f3);
        %data3 = C.Data_5;
        data3 = C.UM_F_all;
        data3a = data3(59,:,:);
        data3b = data3(53,:,:);
        Data3 = cat(3,data3a,data3b);
        
        y1 = mean(Data1,3);
        y2 = mean(Data2,3);
        y3 = mean(Data3,3);
        x = linspace(-200,400,308);
        
     
        subplot(1,2,1)
        plot(x, y1)
        ylim([-10 10])
        hold on
        plot(x,y2)
        hold on
        plot(x,y3)
        ylim([-15 15])
        xline(0);
        yline(0);
        title('PO8-PO4');
        hold off   
        
        % === PO7-PO3 ====
        
        f1 = strcat('unmasked_familiar_all_only_epochrej_new.mat');
        A = load(f1);
        %data1 = A.Data_4;
        data1 = A.UM_Fa_all;
        data1a = data1(58,:,:);
        data1b = data1(52,:,:);
        Data1 = cat(3,data1a,data1b);
        
        f2 = strcat('unmasked_unfamiliar_all_only_epochrej_new.mat');
        B = load(f2);
        %data2 = B.Data_6;
        data2 = B.UM_UF_all;
        data2a = data2(58,:,:);
        data2b = data2(52,:,:);
        Data2 = cat(3,data2a,data2b);
        
        f3 = strcat('unmasked_famous_all_only_epochrej_new.mat');
        C = load(f3);
        %data3 = C.Data_5;
        data3 = C.UM_F_all;
        data3a = data3(58,:,:);
        data3b = data3(52,:,:);
        Data3 = cat(3,data3a,data3b);
        
        y1 = mean(Data1,3);
        y2 = mean(Data2,3);
        y3 = mean(Data3,3);
        x = linspace(-200,400,308);
        
     
        subplot(1,2,2)
        plot(x, y1)
        ylim([-10 10])
        hold on
        plot(x,y2)
        hold on
        plot(x,y3)
        ylim([-15 15])
        xline(0);
        yline(0);
        title('PO7-PO3');
        legend('familiar', 'unfamiliar', 'famous');
        hold off    
   
sgtitle ('Unmasked')

figure()
 % === PO8-PO4 ===
        f1 = strcat('masked_familiar_all_only_epochrej_new.mat');
        A = load(f1);
        %data1 = A.Data_4;
        data1 = A.M_Fa_all;
        data1a = data1(59,:,:);
        data1b = data1(53,:,:);
        Data1 = cat(3,data1a,data1b);
        
        f2 = strcat('masked_unfamiliar_all_only_epochrej_new.mat');
        B = load(f2);
        %data2 = B.Data_6;
        data2 = B.M_UF_all;
        data2a = data2(59,:,:);
        data2b = data2(53,:,:);
        Data2 = cat(3,data2a,data2b);
        
        f3 = strcat('masked_famous_all_only_epochrej_new.mat');
        C = load(f3);
        %data3 = C.Data_5;
        data3 = C.M_F_all;
        data3a = data3(59,:,:);
        data3b = data3(53,:,:);
        Data3 = cat(3,data3a,data3b);
        
        y1 = mean(Data1,3);
        y2 = mean(Data2,3);
        y3 = mean(Data3,3);
        x = linspace(-200,400,308);
        
     
        subplot(1,2,1)
        plot(x, y1)
        ylim([-10 10])
        hold on
        plot(x,y2)
        hold on
        plot(x,y3)
        ylim([-15 15])
        xline(0);
        yline(0);
        title('PO8-PO4');
        hold off   
        
        % === PO7-PO3 ====
        
        f1 = strcat('masked_familiar_all_only_epochrej_new.mat');
        A = load(f1);
        %data1 = A.Data_4;
        data1 = A.M_Fa_all;
        data1a = data1(58,:,:);
        data1b = data1(52,:,:);
        Data1 = cat(3,data1a,data1b);
        
        f2 = strcat('masked_unfamiliar_all_only_epochrej_new.mat');
        B = load(f2);
        %data2 = B.Data_6;
        data2 = B.M_UF_all;
        data2a = data2(58,:,:);
        data2b = data2(52,:,:);
        Data2 = cat(3,data2a,data2b);
        
        f3 = strcat('masked_famous_all_only_epochrej_new.mat');
        C = load(f3);
        %data3 = C.Data_5;
        data3 = C.M_F_all;
        data3a = data3(58,:,:);
        data3b = data3(52,:,:);
        Data3 = cat(3,data3a,data3b);
        
        y1 = mean(Data1,3);
        y2 = mean(Data2,3);
        y3 = mean(Data3,3);
        x = linspace(-200,400,308);
        
     
        subplot(1,2,2)
        plot(x, y1)
        ylim([-10 10])
        hold on
        plot(x,y2)
        hold on
        plot(x,y3)
        ylim([-15 15])
        xline(0);
        yline(0);
        title('PO7-PO3');
        legend('familiar', 'unfamiliar', 'famous');
        hold off    
   
sgtitle ('Masked')
