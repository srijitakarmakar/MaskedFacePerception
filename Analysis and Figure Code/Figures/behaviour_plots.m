
% PLOTTING STARTS
figure()
% performance accuracy of each subject
subplot(3,3,1)
bar([1:t], Perf_Accuracy)
axis([0 t+1 0 100])
yline(45);
yline(70);
%y = [TruePos(1) FalseNeg(1) FalsePos(1) Perf_Accuracy(1); TruePos(2) FalseNeg(2) FalsePos(2) Perf_Accuracy(2); TruePos(3) FalseNeg(3) FalsePos(3) Perf_Accuracy(3); TruePos(4) FalseNeg(4) FalsePos(4) Perf_Accuracy(4)];
%bar(y);
xlabel("Subjects")
ylabel("Performance accuracy on test trials (%)")
title ("Performance accuracy for each subject in test trials")
%ylabel("Performance Results")

subplot(3,3,3)
%b = bar ([1 2 3], category_perf);
stdev = std(sub_cat_results);
b = bar ([1 2 3], mean(sub_cat_results), 'FaceColor', [0.5 0.6 0.3]);
hold on
er = errorbar([1 2 3],mean(sub_cat_results),stdev);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
%b.CData(2,:) = [0.5 0 0.5];
b.CData(3,:) = [0.9 0 0];
barnames={'famous'; 'familiar'; 'unfamiliar' };
set(gca,'xticklabel',barnames)
yline(45);
axis([0 4 40 100])
xlabel("Face Categories")
ylabel("Performance accuracy on test trials (%)")
title ("Mean performance accuracy for three different face categories")

% to print category-wise performance
M = mean(sub_cat_results);
mean_famous_perf = M(:,1)
mean_familiar_perf = M(:,2)
mean_unfamiliar_perf = M(:,3)

% to plot overall RT
RT = zeros(t,1);
std_RT = zeros(t,1);
for k = 1:t
    RT(k,:)=mean(sub_cat_RT(k,:));
    std_RT(k,:)=std(sub_cat_RT(k,:));
end
subplot(3,3,2)
bar([1:t], RT, 'FaceColor', [0.5 0.6 0.3])
xlabel("Subjects")
ylabel("Mean RT on test trials (sec)")
title ("Mean reaction time for each subject on test trials")
%axis([0 t+1 0 1])
hold on
er = errorbar([1:t],RT,std_RT);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  

% to plot category-wise RT
subplot(3,3,4)
stdev2 = std(sub_cat_RT);
b = bar ([1 2 3], mean(sub_cat_RT),'FaceColor', [0.5 0.6 0.3]);
hold on
er = errorbar([1 2 3],mean(sub_cat_RT),stdev2);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
%b.FaceColor = 'flat';
b.CData(2,:) = [0.5 0 0.5];
b.CData(3,:) = [0.9 0 0];
barnames={'famous'; 'familiar'; 'unfamiliar' };
set(gca,'xticklabel',barnames)
axis([0 4 0 0.7])
xlabel("Face Categories")
ylabel("Mean RT on test trials (sec)")
title ("Mean reaction time for three different face categories")

% plot proportion of masked faces in TP, FN, TN, FN

subplot(3,3,7)
sub_mask_results = horzcat(MaskedTP, MaskedFN, MaskedFP, MaskedTN);
stdev3 = std(sub_mask_results);
b = bar ([1 2 3 4], mean(sub_mask_results));
hold on
er = errorbar([1 2 3 4],mean(sub_mask_results),stdev3);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
b.FaceColor = 'flat';
b.CData(2,:) = [0.5 0 0.5];
b.CData(3,:) = [0.9 0 0];
b.CData(4,:) = [0.7 0.6 0];
barnames={'TP'; 'FN'; 'FP'; 'TN' };
set(gca,'xticklabel',barnames)
yline(0.5);
%axis([0 4 0 1])
xlabel("Response Type")
ylabel("Proportion of masked faces present")
title ("Proportion of Masked Faces v/s Response Types")

% to plot accuracy for masked vs unmasked conditions

subplot(3,3,5)
sub_mask = horzcat(unmasked_accuracy, masked_accuracy);
stdev4 = std(sub_mask)*100;
b = bar ([1 2], mean(sub_mask)*100, 'FaceColor', [0.8 0 0.3]);
hold on
er = errorbar([1 2],mean(sub_mask)*100,stdev4);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
%b.FaceColor = 'flat';
b.CData(2,:) = [0.5 0 0.5];
%b.CData(3,:) = [0.9 0 0];
%b.CData(4,:) = [0.7 0.6 0];
barnames={'unmasked'; 'masked'};
set(gca,'xticklabel',barnames)
yline(45);
axis([0 3 40 100])
xlabel("Mask Condition")
ylabel("Mean Performance Accuracy")
title ("Mean Performance Accuracy v/s Mask Condition")

% to plot RT for masked vs unmasked conditions

subplot(3,3,6)
stdev5 = std(sub_mask_RT);
b = bar ([1 2], mean(sub_mask_RT), 'FaceColor', [0.8 0 0.3]);
hold on
er = errorbar([1 2],mean(sub_mask_RT),stdev5);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
%b.FaceColor = 'flat';
b.CData(2,:) = [0.5 0 0.5];
%b.CData(3,:) = [0.9 0 0];
barnames={'unmasked'; 'masked'};
set(gca,'xticklabel',barnames)
axis([0 3 0 0.7])
xlabel("Mask Conditions")
ylabel("Mean RT on test trials (sec)")
title ("Mean Reaction Time for two Mask Conditions")

% to plot proportion of face categories in each response type


%subplot(3,3,9)

% to plot mean perf accuracy, face category v/s mask
figure()

subplot(2,3,1)
cat_mask_mean = reshape(mean(cat_mask),3,2);
h=bar(cat_mask_mean*100);
yline(45);
hold on
stdev10 = reshape(std(cat_mask),3,2);
ngroups = size(cat_mask_mean, 1);
nbars = size(cat_mask_mean, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    er = errorbar(x, cat_mask_mean(:,i)*100, stdev10(:,i)*100, '.');
    er.Color = [0 0 0];                            
    er.LineStyle = 'none'; 
end
hold off
barnames={'Famous'; 'Familiar'; 'Unfamiliar'};
set(gca,'xticklabel',barnames);
%set(gca, 'XTick', 1:3, 'XTickLabels', {'Famous','Familiar','Unfamiliar'})
set(h, {'DisplayName'}, {'unmasked','masked'}')
xlabel("Face Category")
ylabel("Mean Performance Accuracy (%)")
title ("Mean Performance Accuracy v/s Face Category")
legend(h(1:2));

subplot(2,3,2)
sub_cat_mean = reshape(mean(sub_cat),4,3);
b=bar([1 2 3], sub_cat_mean(1,:));
hold on
stdev6 = reshape(std(sub_cat),4,3);
er = errorbar([1 2 3],sub_cat_mean(1,:),stdev6(1,:));    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
b.FaceColor = 'flat';
b.CData(2,:) = [0.5 0 0.5]; 
b.CData(3,:) = [0.9 0.9 0]; 
barnames={'Famous'; 'Familiar'; 'Unfamiliar'}; %'FN'; 'FP'; 'TN'};
set(gca,'xticklabel',barnames);
xlabel("True Positive")
ylabel("Proportion of TP trials among all trials")
title ("Proportion TP Response vs Face Type")

subplot(2,3,3)
%sub_cat_mean = reshape(mean(sub_cat),4,3);
b=bar([1 2 3], sub_cat_mean(2,:));
hold on
%stdev6 = reshape(std(sub_cat),4,3);
er = errorbar([1 2 3],sub_cat_mean(2,:),stdev6(2,:));    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
b.FaceColor = 'flat';
b.CData(2,:) = [0.5 0 0.5]; 
b.CData(3,:) = [0.9 0.9 0]; 
barnames={'Famous'; 'Familiar'; 'Unfamiliar'}; %'FN'; 'FP'; 'TN'};
set(gca,'xticklabel',barnames);
xlabel("False Negative")
ylabel("Proportion FN trials among all trials")
title ("Proportion of FN Response vs Face Type")

subplot(2,3,4)
%sub_cat_mean = reshape(mean(sub_cat),4,3);
b=bar([1 2 3], sub_cat_mean(3,:));
hold on
%stdev6 = reshape(std(sub_cat),4,3);
er = errorbar([1 2 3],sub_cat_mean(3,:),stdev6(3,:));    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
b.FaceColor = 'flat';
b.CData(2,:) = [0.5 0 0.5]; 
b.CData(3,:) = [0.9 0.9 0]; 
barnames={'Famous'; 'Familiar'; 'Unfamiliar'}; %'FN'; 'FP'; 'TN'};
set(gca,'xticklabel',barnames);
xlabel("False Positive")
ylabel("Proportion of FP trials among all trials")
title ("Proportion of FP Response vs Face Type")

subplot(2,3,5)
%sub_cat_mean = reshape(mean(sub_cat),4,3);
b=bar([1 2 3], sub_cat_mean(4,:));
hold on
%stdev6 = reshape(std(sub_cat),4,3);
er = errorbar([1 2 3],sub_cat_mean(4,:),stdev6(4,:));    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
b.FaceColor = 'flat';
b.CData(2,:) = [0.5 0 0.5]; 
b.CData(3,:) = [0.9 0.9 0]; 
barnames={'Famous'; 'Familiar'; 'Unfamiliar'}; %'FN'; 'FP'; 'TN'};
set(gca,'xticklabel',barnames);
xlabel("True Negative")
ylabel("Proportion of TN trials among all trials")
title ("Proportion of TN Response vs Face Type")


figure()
subplot(2,2,1)
sub_cat_mask_TP = [sub_cat_mask(:,1) sub_cat_mask(:,5) sub_cat_mask(:,9) sub_cat_mask(:,13) sub_cat_mask(:,17) sub_cat_mask(:,21)];
sub_cat_mask_TP_mean = reshape(mean(sub_cat_mask_TP),3,2);
h=bar(sub_cat_mask_TP_mean);
%yline(0.17);
hold on
stdev7 = reshape(std(sub_cat_mask_TP),3,2);
ngroups = size(sub_cat_mask_TP_mean, 1);
nbars = size(sub_cat_mask_TP_mean, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    er = errorbar(x, sub_cat_mask_TP_mean(:,i), stdev7(:,i), '.');
    er.Color = [0 0 0];                            
    er.LineStyle = 'none'; 
end
hold off
barnames={'Famous'; 'Familiar'; 'Unfamiliar'};
set(gca,'xticklabel',barnames);
%set(gca, 'XTick', 1:3, 'XTickLabels', {'Famous','Familiar','Unfamiliar'})
set(h, {'DisplayName'}, {'unmasked','masked'}')
xlabel("Face Category")
ylabel("Proportion of TP trials among all trials")
title ("Proportion of TP Response")
legend(h(1:2));

subplot(2,2,2)
sub_cat_mask_FN = [sub_cat_mask(:,2) sub_cat_mask(:,6) sub_cat_mask(:,10) sub_cat_mask(:,14) sub_cat_mask(:,18) sub_cat_mask(:,22)];
sub_cat_mask_FN_mean = reshape(mean(sub_cat_mask_FN),3,2);
h=bar(sub_cat_mask_FN_mean);
%yline(0.17);
hold on
stdev8 = reshape(std(sub_cat_mask_FN),3,2);
ngroups = size(sub_cat_mask_FN_mean, 1);
nbars = size(sub_cat_mask_FN_mean, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    er = errorbar(x, sub_cat_mask_FN_mean(:,i), stdev8(:,i), '.');
    er.Color = [0 0 0];                            
    er.LineStyle = 'none'; 
end
hold off
barnames={'Famous'; 'Familiar'; 'Unfamiliar'};
set(gca,'xticklabel',barnames);
%set(gca, 'XTick', 1:3, 'XTickLabels', {'Famous','Familiar','Unfamiliar'})
set(h, {'DisplayName'}, {'unmasked','masked'}')
xlabel("Face Category")
ylabel("Proportion of FN trials among all trials")
title ("Proportion of FN Response")
legend(h(1:2));

subplot(2,2,3)
sub_cat_mask_FP = [sub_cat_mask(:,3) sub_cat_mask(:,7) sub_cat_mask(:,11) sub_cat_mask(:,15) sub_cat_mask(:,19) sub_cat_mask(:,23)];
sub_cat_mask_FP_mean = reshape(mean(sub_cat_mask_FP),3,2);
h=bar(sub_cat_mask_FP_mean);
%yline(0.17);
hold on
stdev9 = reshape(std(sub_cat_mask_FP),3,2);
ngroups = size(sub_cat_mask_FP_mean, 1);
nbars = size(sub_cat_mask_FP_mean, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    er = errorbar(x, sub_cat_mask_FP_mean(:,i), stdev9(:,i), '.');
    er.Color = [0 0 0];                            
    er.LineStyle = 'none'; 
end
hold off
barnames={'Famous'; 'Familiar'; 'Unfamiliar'};
set(gca,'xticklabel',barnames);
%set(gca, 'XTick', 1:3, 'XTickLabels', {'Famous','Familiar','Unfamiliar'})
set(h, {'DisplayName'}, {'unmasked','masked'}')
xlabel("Face Category")
ylabel("Proportion of FP trials among all trials")
title ("Proportion of FP Response")
legend(h(1:2));

subplot(2,2,4)
sub_cat_mask_TN = [sub_cat_mask(:,4) sub_cat_mask(:,8) sub_cat_mask(:,12) sub_cat_mask(:,16) sub_cat_mask(:,20) sub_cat_mask(:,24)];
sub_cat_mask_TN_mean = reshape(mean(sub_cat_mask_TN),3,2);
h=bar(sub_cat_mask_TN_mean);
%yline(0.17);
hold on
stdev10 = reshape(std(sub_cat_mask_TN),3,2);
ngroups = size(sub_cat_mask_TN_mean, 1);
nbars = size(sub_cat_mask_TN_mean, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    er = errorbar(x, sub_cat_mask_TN_mean(:,i), stdev10(:,i), '.');
    er.Color = [0 0 0];                            
    er.LineStyle = 'none'; 
end
hold off
barnames={'Famous'; 'Familiar'; 'Unfamiliar'};
set(gca,'xticklabel',barnames);
%set(gca, 'XTick', 1:3, 'XTickLabels', {'Famous','Familiar','Unfamiliar'})
set(h, {'DisplayName'}, {'unmasked','masked'}')
xlabel("Face Category")
ylabel("Proportion of TN trials among all trials")
title ("Proportion of TN Response")
legend(h(1:2));

figure()

subplot(2,3,1)
boxplot(sub_cat_results)
barnames={'famous'; 'familiar'; 'unfamiliar' };
set(gca,'xticklabel',barnames)
yline(50);
%axis([0 4 0 100])
xlabel("Face Categories")
ylabel("Performance accuracy on test trials (%)")
title ("Distribution of performance accuracy for three face categories")

subplot(2,3,2)
boxplot(sub_cat_RT);
barnames={'famous'; 'familiar'; 'unfamiliar' };
set(gca,'xticklabel',barnames)
%axis([0 4 0 1])
xlabel("Face Categories")
ylabel("Mean RT on test trials (sec)")
title ("Distribution of mean RT for three face categories")

subplot(2,3,3)
boxplot(sub_mask)
barnames={'unmasked'; 'masked'};
set(gca,'xticklabel',barnames)
yline(0.5);
%axis([0 4 0 1])
xlabel("Mask Condition")
ylabel("Performance Accuracy")
title ("Dist. of Performance Accuracy for two Mask Condition")

subplot(2,3,4)
boxplot(sub_mask_RT)
barnames={'unmasked'; 'masked'};
set(gca,'xticklabel',barnames)
%axis([0 4 0 1])
xlabel("Mask Conditions")
ylabel("Mean RT on test trials (sec)")
title ("Dist. of Reaction Time for two Mask Conditions")

subplot(2,3,5)
boxplot(sub_mask_results)
barnames={'TP'; 'FN'; 'FP'; 'TN' };
set(gca,'xticklabel',barnames)
yline(0.5);
%axis([0 4 0 1])
xlabel("Response Type")
ylabel("Proportion of masked faces present")
title ("Dist. of Proportion of Masked Faces v/s Response Types")

%subplot(2,3,6)

figure()
subplot(2,2,1)
boxplot(sub_cat_box(:,1:3))
barnames={'famous'; 'familiar'; 'unfamiliar'}; %'famousFN'; 'familiarFN'; 'unfamiliaFN'; 'famousFP'; 'familiarFP'; 'unfamiliarFP'; 'famousTN'; 'familiarTN'; 'unfamiliarTN'};
set(gca,'xticklabel',barnames)
%xtickangle(90)
%xline(3.5);
%xline(6.5);
%xline(9.5);
%yline(0.33);
xlabel("True Positive")
ylabel("Proportion of each face category")
title ("Proportion of Faces of each Category v/s TP Response Type")

subplot(2,2,2)
boxplot(sub_cat_box(:,4:6))
barnames={'famous'; 'familiar'; 'unfamiliar'}; %'famousFN'; 'familiarFN'; 'unfamiliaFN'; 'famousFP'; 'familiarFP'; 'unfamiliarFP'; 'famousTN'; 'familiarTN'; 'unfamiliarTN'};
set(gca,'xticklabel',barnames)
%xtickangle(90)
%xline(3.5);
%xline(6.5);
%xline(9.5);
%yline(0.33);
xlabel("False Negative")
ylabel("Proportion of each face category")
title ("Proportion of Faces of each Category v/s FN Response Type")

subplot(2,2,3)
boxplot(sub_cat_box(:,7:9))
barnames={'famous'; 'familiar'; 'unfamiliar'}; %'famousFN'; 'familiarFN'; 'unfamiliaFN'; 'famousFP'; 'familiarFP'; 'unfamiliarFP'; 'famousTN'; 'familiarTN'; 'unfamiliarTN'};
set(gca,'xticklabel',barnames)
%xtickangle(90)
%xline(3.5);
%xline(6.5);
%xline(9.5);
%yline(0.33);
xlabel("False Positive")
ylabel("Proportion of each face category")
title ("Proportion of Faces of each Category v/s FP Response Type")

subplot(2,2,4)
boxplot(sub_cat_box(:,10:12))
barnames={'famous'; 'familiar'; 'unfamiliar'}; %'famousFN'; 'familiarFN'; 'unfamiliaFN'; 'famousFP'; 'familiarFP'; 'unfamiliarFP'; 'famousTN'; 'familiarTN'; 'unfamiliarTN'};
set(gca,'xticklabel',barnames)
%xtickangle(90)
%xline(3.5);
%xline(6.5);
%xline(9.5);
%yline(0.33);
xlabel("True Negative")
ylabel("Proportion of each face category")
title ("Proportion of Faces of each Category v/s TN Response Type")

% figure()
% %Data = sub_cat_mask(:,[3 7 11 15 19 23]);
% bar(mean(sub_cat_mask_FP_2))

figure()

cat_mask_mean_RT = reshape(mean(cat_mask_RT),3,2);
h=bar(cat_mask_mean_RT);
hold on
stdev10 = reshape(std(cat_mask_RT),3,2);
ngroups = size(cat_mask_mean_RT, 1);
nbars = size(cat_mask_mean_RT, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    er = errorbar(x, cat_mask_mean_RT(:,i), stdev10(:,i), '.');
    er.Color = [0 0 0];                            
    er.LineStyle = 'none'; 
    er.LineWidth = 2;
end
hold off
%sigline([1 2],'***')
barnames={'Famous'; 'Familiar'; 'Unfamiliar'};
set(gca,'xticklabel',barnames);
%set(gca, 'XTick', 1:3, 'XTickLabels', {'Famous','Familiar','Unfamiliar'})
set(h, {'DisplayName'}, {'unmasked','masked'}')
axis([0 4 0 0.7])
ax = gca;
ax.FontSize = 20;
xlabel("Face Category")
ylabel("Mean Reaction Time(s)")
title ("Mean Reaction Time v/s Face Category")
legend(h(1:2));

f1 = strcat(file_path, 'TP');
save(f1,'sub_cat_mask_TP')
f1 = strcat(file_path, 'FN');
save(f1,'sub_cat_mask_FN')
f1 = strcat(file_path, 'FP');
save(f1,'sub_cat_mask_FP')
f1 = strcat(file_path, 'TN');
save(f1,'sub_cat_mask_TN')
