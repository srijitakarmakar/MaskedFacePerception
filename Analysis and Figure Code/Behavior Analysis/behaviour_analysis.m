% code to analyze behavioral pilot for performance accuracy and reaction
% time (for true positive data)
% NOTE: sub_mask_results stores the proportion of masked faces in different
% response types (TP, FN, FP, TN)
% and sub_mask stores performance accuracy of subjects according to mask
% type (unmasked v/s masked)
file_path = 'E:\\Srijita\\Data Files\\Behavior Pilots\\2-back\\Unfamiliar-constant (new analysis, Jan 22)\\Results\\';
%subject = [3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43];
%subject = [3,4,5,7,8,9,10,11,12,13,15,17,19,20,21,22,23,24,25,26,27,28,29,31,32,33,34,35,36,37,38,39,41,42,43];
%subject = [3,4,5,7,8,9,10,11,12,13,15,19,20,21,22,23,24,25,26,27,28,29,31,32,33,34,35,36,38,39,41,42,43]; % >=50% performance (chance = 50%)

subject = [3,4,5,6,7,8,9,10,11,12,13,15,17,19,20,21,22,23,24,25,26,27,28,29,31,32,33,34,35,36,37,38,39,41,42,43];
rating_matrix_correction = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	1	0; 1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	0	1	1	1	0	0	1	0	0	0	0	0	0	0	1	0	0	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	0	0	0	1	1	0	0	0	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	0	1	0	0	0	0	0	0	0	0	0	0	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	1	1	1	0	1	0	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	0	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	1	0	0	0	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	0	1	0	1	1	1	1; 1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	1	0	0	1	1	1	0	1	1	0	0	0	1	0	1	0	0	0	1	0	0	0	0	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	0	1	1	0	1	1	0	0	0	0	1	1	1	0	1	1	1; 1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	0	0	1	1	0	1	1	1	1	1	1; 0	1	0	0	0	0	0	1	0	1	1	1	1	1	1	1	0	0	1	1	0	0	0	0	0	1	1	0	1	0	0	0	0	0	0	0	1	0	0	0; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	0	1	1	1	1	1	1	0; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	1	0	1	0	0	1	0	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	0	0	0	1	0	0	1	0	1	0; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	0	1	1	0	0	0	0	0	0	0	1	0	1	0; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	1	0	0	1	0	1	1	0	0	0	0	0	0	0	1	0	0	0; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	0	0	0	0	0	0	0	1	1	0	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	1	0	0	0	0	0	0	0	0	1	0	0	0; 1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	0	0	1	1	0	0	1	0	1	1	0	1	1	0	0	0	0	0	0	0	1	0	0	0; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	1	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	0	0	0	0	0	0	1	1	1	0	1; 1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	0	0	0	1	1	0	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	0	0	0	0	0	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	0	1	1	1	1	1	1	1	0	0	1	0	1	1	1	1; 1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	0	0	1	1	0	1	1	1	1	1	1	1	1	1	1	0	1	1	1	0	1	0	1	1; 0	1	1	1	0	0	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	0	1	1	0	0	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	1	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	0	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	0	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	0	1	0	1	0	1	0; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1]; % t  X 40 matrix, to store familiarity rating of individual subjects for 40 faces
% to store only >45% performance accuracy
%rating_matrix_correction = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	1	0; 1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	0	1	1	1	0	0	1	0	0	0	0	0	0	0	1	0	0	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	0	0	0	1	1	0	0	0	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	1	1	1	0	1	0	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	0	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	1	0	0	0	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	0	1	0	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	0	1	1	0	1	1	0	0	0	0	1	1	1	0	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	0	0	1	1	0	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	0	1	1	1	1	1	1	0; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	1	0	1	0	0	1	0	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	0	0	0	1	0	0	1	0	1	0; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	0	1	1	0	0	0	0	0	0	0	1	0	1	0; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	1	0	0	1	0	1	1	0	0	0	0	0	0	0	1	0	0	0; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	0	0	0	0	0	0	0	1	1	0	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	1	0	0	0	0	0	0	0	0	1	0	0	0; 1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	0	0	1	1	0	0	1	0	1	1	0	1	1	0	0	0	0	0	0	0	1	0	0	0; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	1	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	0	0	0	0	0	0	1	1	1	0	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	0	0	0	0	0	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	0	1	1	1	1	1	1	1	0	0	1	0	1	1	1	1; 1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	0	0	1	1	0	1	1	1	1	1	1	1	1	1	1	0	1	1	1	0	1	0	1	1; 0	1	1	1	0	0	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	0	1	1	0	0	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	1	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	0	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	0	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	0	1	0	1	0	1	0; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1; 1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1];

% to store only >50% performance accuracy
rating_matrix_correction([12,14,16,28,38],:) = []; 

block = 15;
t = length(subject);
perf_table = zeros(t,10); % col 1: subject, col2: TP,col3: MTP, col4: FN, col5: MFN, col6: FP, col7: MFP, col8: TN, col9: MTN, col10: accuracy = TP/TP+FN
result_copy = zeros(450,4,t);
sub_cat_mask_FP_2 = zeros(t,6);

% to view category-wise results
%familiar_index = [4,28,36,44,63,82,94,98,126,145,154,171,185,207,235,240,261,266,278,293,305,309,349,353,376,386,398,419,441,446];
%famous_index = [15,24,39,53,74,86,102,120,129,135,167,174,190,210,214,229,253,257,282,300,313,330,337,357,381,390,393,409,423,450];
%unfamiliar_index = [8,19,49,59,67,71,108,111,139,150,160,179,196,203,219,225,244,269,273,290,321,325,343,360,364,371,406,414,430,434];
% task_index = horzcat(familiar_index, famous_index, unfamiliar_index);
% nontask_index = setdiff([1:450],task_index);
% familiar_results = zeros(30,4,t);
% famous_results = zeros(30,4,t);
% unfamiliar_results = zeros(30,4,t);
%n = length(familiar_results);
sub_cat_results = zeros(t,3); % to store category-wise perf_accuracy for each subject (rows), col1: famous, col2: familiar, col3:unfamiliar
% to see category-wise results, call "result_copy(category_index,:,subno)"
% where category: familiar/unfamiliar/famous and subno is subject number
sub_cat_RT = zeros(t,3); % to store subject and category wise RTs: rows are subjects, col1: famousRT col2: familiar RT, col3:unfamiliar RT
% to view masked v/s unmasked result
unmasked_accuracy = zeros(t,1);
masked_accuracy = zeros(t,1);

sub_mask_RT = zeros(t,2);
sub_cat = zeros(t,12); % to store proportion of each category of faces found in each response type (FN, TN, TP, FP) 
sub_cat_box = zeros(t,12);
sub_cat_mask = zeros(t,24); % to store subjbect-wise TP,FN,FP,TN broken down across mask type and category (eg., proportion of masked familiar in TP)
cat_mask = zeros(t,6);
cat_mask_RT = zeros(t,6);

cat_mask_spec = zeros(t,6);
cat_mask_tacc = zeros(t,6);

for i = 1:t
    counter = 360;
    c = [];
    a = num2str(subject(1,i));
    %a = '2';
    for j = 1:block
        b = num2str(j);
        filename = sprintf('Log_subject%s_block_%s.mat', a, b);
        data = load (filename);
        result = data.rating;
        c = vertcat(c,result);
    end
    result_copy (:,:,i)= c; % NOTE: to see individual subject's TP/FP/FN image indices, type "result_copy(xx,1,subno)" where xx is tp/fn/fp and subno is subject number
    c(:,1)=[];
    c(:,2)=[];
    
    % correcting for 4 TN trials
    
    if c(124,1)==0 && c(124,2)==0
        c(124,:)=[0,1];
    elseif c(124,1)==1 && c(124,2)==1
        c(124,:)=[1,0];        
    end
    if c(297,1)==0 && c(297,2)==0
        c(297,:)=[0,1];
    elseif c(297,1)==1 && c(297,2)==1
        c(297,:)=[1,0];        
    end
    if c(345,1)==0 && c(345,2)==0
        c(345,:)=[0,1];
    elseif c(345,1)==1 && c(345,2)==1
        c(345,:)=[1,0];        
    end
    if c(383,1)==0 && c(383,2)==0
        c(383,:)=[0,1];
    elseif c(383,1)==1 && c(383,2)==1
        c(383,:)=[1,0];        
    end
    
    % moving familiar and famous faces to unfamiliar face category subject-wise (faces that are unknown to subjects)
    move = find(rating_matrix_correction(i,:)==0);
    stin = move*6 - 5;
    enin = move*6;
    for k = 1:length(move)
        for j = 1:7
            m = j-1;
            a = result_copy(:,1,i)==stin(k)+m;
            result_copy(a,1,i) = round(counter+1);
            counter = counter+1;
        end
    end

    % calculating TP, FN and FP counts
    tp = find (c(:,1)==1 & c(:,2)==1);
    M_tp = find (c(:,1)==1 & c(:,2)==1 & rem(result_copy(:,1,i),2)==0==1);
    UM_tp = find (c(:,1)==1 & c(:,2)==1 & rem(result_copy(:,1,i),2)==0==0);
    fn = find (c(:,1)==0 & c(:,2)==0);
    fp = find (c(:,1)==1 & c(:,2)==0);
    tn = find (c(:,1)==0 & c(:,2)==1);
    TP = size (tp);
    FP = size (fp);
    TN = size (tn);
    FN = size (fn);
    tr = TP(1,1);
    fl = FN(1,1);
    
    % counting wrt to mask type
    
    unmasked_TP = length(find(rem(result_copy(tp,1,i),2)==0 == 1));
    masked_TP = length(find(rem(result_copy(tp,1,i),2)==0 == 0));
    unmasked_FN = length(find(rem(result_copy(fn,1,i),2)==0 == 1));
    masked_FN = length(find(rem(result_copy(fn,1,i),2)==0 == 0));
    unmasked_TN = length(find(rem(result_copy(tn,1,i),2)==0 == 1));
    masked_TN = length(find(rem(result_copy(tn,1,i),2)==0 == 0));
    unmasked_FP = length(find(rem(result_copy(fp,1,i),2)==0 == 1));
    masked_FP = length(find(rem(result_copy(fp,1,i),2)==0 == 0));
    unmasked_accuracy(i,:) = unmasked_TP/(unmasked_TP+unmasked_FN);
    masked_accuracy(i,:) = masked_TP/(masked_TP+masked_FN);
    
    famous_index = find(result_copy(:,1,i)<121);
    familiar_index = find(result_copy(:,1,i)>120 & result_copy(:,1,i)<241);
    unfamiliar_index = find(result_copy(:,1,i)>240 & result_copy(:,1,i)<361);
    
    a = length(famous_index);
    famous_results = zeros(a,4);
    b = length(familiar_index);
    familiar_results = zeros(b,4);
    c = length(unfamiliar_index);
    unfamiliar_results = zeros(c,4);
    
    
%     % counting proportion of TP composed of famous, familiar, unfamiliar faces 
%     TP_index = result_copy(tp,1,i);
%     
%     famousTP = length(TP_index((TP_index<121)))/(a*length(tp));%/30.0;
%     masked_famous_TP = length(TP_index(TP_index<121 & rem(TP_index,2)==0==0))/(a*length(tp));
%     unmasked_famous_TP = length(TP_index(TP_index<121 & rem(TP_index,2)==0==1))/(a*length(tp));
%     
%     familiarTP = length(TP_index(TP_index > 120 & TP_index < 241))/(b*length(tp));%/30.0;
%     masked_familiar_TP = length(TP_index(TP_index>120 & TP_index <241 & rem(TP_index,2)==0==0))/(b*length(tp));
%     unmasked_familiar_TP = length(TP_index(TP_index>120 & TP_index <241 & rem(TP_index,2)==0==1))/(b*length(tp));
%     
%     unfamiliarTP = length(TP_index(TP_index > 240))/(c*length(tp));%/30.0;
%     masked_unfamiliar_TP = length(TP_index(TP_index>240 & rem(TP_index,2)==0==0))/(c*length(tp));
%     unmasked_unfamiliar_TP = length(TP_index(TP_index>240 & rem(TP_index,2)==0==1))/(c*length(tp));
%     
%     % counting proportion of FN composed of famous, familiar, unfamiliar faces 
%     FN_index = result_copy(fn,1,i);
%     
%     famousFN = length(FN_index(FN_index<121))/(a*length(fn));%/30.0;
%     masked_famous_FN = length(FN_index(FN_index<121 & rem(FN_index,2)==0==0))/(a*length(fn));
%     unmasked_famous_FN = length(FN_index(FN_index<121 & rem(FN_index,2)==0==1))/(a*length(fn));
%     
%     familiarFN = length(FN_index(FN_index > 120 & FN_index < 241))/(b*length(fn));%/30.0;
%     masked_familiar_FN = length(FN_index(FN_index>120 & FN_index <241 & rem(FN_index,2)==0==0))/(b*length(fn));
%     unmasked_familiar_FN = length(FN_index(FN_index>120 & FN_index <241 & rem(FN_index,2)==0==1))/(b*length(fn));
%   
%     unfamiliarFN = length(FN_index(FN_index > 240))/(c*length(fn));%/30.0;
%     masked_unfamiliar_FN = length(FN_index(FN_index>240 & rem(FN_index,2)==0==0))/(c*length(fn));
%     unmasked_unfamiliar_FN = length(FN_index(FN_index>240 & rem(FN_index,2)==0==1))/(c*length(fn));
%     
%     % counting proportion of FP composed of famous, familiar, unfamiliar faces 
%     FP_index = result_copy(fp,1,i);
%     
%     famousFP = length(FP_index(FP_index<121))/(a*length(fp));%/120.0;
%     masked_famous_FP = length(FP_index(FP_index<121 & rem(FP_index,2)==0==0))/(a*length(fp));
%     unmasked_famous_FP = length(FP_index(FP_index<121 & rem(FP_index,2)==0==1))/(a*length(fp));
%     
%     familiarFP = length(FP_index(FP_index > 120 & FP_index < 241))/(b*length(fp));%/120.0;
%     masked_familiar_FP = length(FP_index(FP_index>120 & FP_index <241 & rem(FP_index,2)==0==0))/(b*length(fp));
%     unmasked_familiar_FP = length(FN_index(FP_index>120 & FP_index <241 & rem(FP_index,2)==0==1))/(b*length(fp));
%     
%     unfamiliarFP = length(FP_index(FP_index > 240))/(c*length(fp));%/120.0;
%     masked_unfamiliar_FP = length(FP_index(FP_index>240 & rem(FP_index,2)==0==0))/(c*length(fp));
%     unmasked_unfamiliar_FP = length(FP_index(FP_index>240 & rem(FP_index,2)==0==1))/(c*length(fp));
 

% counting proportion of TP composed of famous, familiar, unfamiliar faces 
    TP_index = result_copy(tp,1,i);
    TP_index_RT = [TP_index, tp];
    
    % % ==== RT =====
    masked_famous_RT_index = TP_index(TP_index<121 & rem(TP_index,2)==0==0);
    [val,idx] = ismember(masked_famous_RT_index,TP_index_RT(:,1));
    M_F_RT_index = TP_index_RT (idx,2);
    M_F_RT = result_copy(M_F_RT_index, 3, i);
    masked_famous_RT = mean(M_F_RT);
    
    unmasked_famous_RT_index = TP_index(TP_index<121 & rem(TP_index,2)==0==1);
    [val,idx] = ismember(unmasked_famous_RT_index,TP_index_RT(:,1));
    UM_F_RT_index = TP_index_RT (idx,2);
    UM_F_RT = result_copy(UM_F_RT_index, 3, i);
    unmasked_famous_RT = mean(UM_F_RT);
    
    masked_familiar_RT_index = TP_index(TP_index>120 & TP_index <241 & rem(TP_index,2)==0==0);
    [val,idx] = ismember(masked_familiar_RT_index,TP_index_RT(:,1));
    M_Fa_RT_index = TP_index_RT (idx,2);
    M_Fa_RT = result_copy(M_Fa_RT_index, 3, i);
    masked_familiar_RT = mean(M_Fa_RT);
    
    unmasked_familiar_RT_index = TP_index(TP_index>120 & TP_index <241 & rem(TP_index,2)==0==1);
    [val,idx] = ismember(unmasked_familiar_RT_index,TP_index_RT(:,1));
    UM_Fa_RT_index = TP_index_RT (idx,2);
    UM_Fa_RT = result_copy(UM_Fa_RT_index, 3, i);
    unmasked_familiar_RT = mean(UM_Fa_RT);
    
    masked_unfamiliar_RT_index = TP_index(TP_index>240 & TP_index <361 & rem(TP_index,2)==0==0);
    [val,idx] = ismember(masked_unfamiliar_RT_index,TP_index_RT(:,1));
    M_UF_RT_index = TP_index_RT (idx,2);
    M_UF_RT = result_copy(M_UF_RT_index, 3, i);
    masked_unfamiliar_RT = mean(M_UF_RT);
    
    unmasked_unfamiliar_RT_index = TP_index(TP_index>240 & TP_index <361 & rem(TP_index,2)==0==1);
    [val,idx] = ismember(unmasked_unfamiliar_RT_index,TP_index_RT(:,1));
    UM_UF_RT_index = TP_index_RT (idx,2);
    UM_UF_RT = result_copy(UM_UF_RT_index, 3, i);
    unmasked_unfamiliar_RT = mean(UM_UF_RT);
    
    % % ===== Performance Accuracy ====
    
    famousTP = length(TP_index((TP_index<121)))/(a);%/30.0;
    masked_famous_TP = length(TP_index(TP_index<121 & rem(TP_index,2)==0==0))/(a/2); % propotion is stored, not number
    unmasked_famous_TP = length(TP_index(TP_index<121 & rem(TP_index,2)==0==1))/(a/2);
    
    familiarTP = length(TP_index(TP_index > 120 & TP_index < 241))/(b);%/30.0;
    masked_familiar_TP = length(TP_index(TP_index>120 & TP_index <241 & rem(TP_index,2)==0==0))/(b/2);
    unmasked_familiar_TP = length(TP_index(TP_index>120 & TP_index <241 & rem(TP_index,2)==0==1))/(b/2);
    
    unfamiliarTP = length(TP_index(TP_index > 240 & TP_index <361))/(c);%/30.0;
    masked_unfamiliar_TP = length(TP_index(TP_index>240 & TP_index <361 & rem(TP_index,2)==0==0))/(c/2);
    unmasked_unfamiliar_TP = length(TP_index(TP_index>240 & TP_index <361 & rem(TP_index,2)==0==1))/(c/2);
    
    % counting proportion of FN composed of famous, familiar, unfamiliar faces 
    FN_index = result_copy(fn,1,i);
    
    famousFN = length(FN_index(FN_index<121))/(a);%/30.0;
    masked_famous_FN = length(FN_index(FN_index<121 & rem(FN_index,2)==0==0))/(a/2);
    unmasked_famous_FN = length(FN_index(FN_index<121 & rem(FN_index,2)==0==1))/(a/2);
    
    familiarFN = length(FN_index(FN_index > 120 & FN_index < 241))/(b);%/30.0;
    masked_familiar_FN = length(FN_index(FN_index>120 & FN_index <241 & rem(FN_index,2)==0==0))/(b/2);
    unmasked_familiar_FN = length(FN_index(FN_index>120 & FN_index <241 & rem(FN_index,2)==0==1))/(b/2);
  
    unfamiliarFN = length(FN_index(FN_index > 240 & FN_index <361))/(c);%/30.0;
    masked_unfamiliar_FN = length(FN_index(FN_index>240 & FN_index <361 & rem(FN_index,2)==0==0))/(c/2);
    unmasked_unfamiliar_FN = length(FN_index(FN_index>240 & FN_index <361 & rem(FN_index,2)==0==1))/(c/2);
    
    % counting proportion of FP composed of famous, familiar, unfamiliar faces 
    FP_index = result_copy(fp,1,i);
    
    famousFP = length(FP_index(FP_index<121))/(a);%/120.0;
    masked_famous_FP = length(FP_index(FP_index<121 & rem(FP_index,2)==0==0))/(a/2);
    unmasked_famous_FP = length(FP_index(FP_index<121 & rem(FP_index,2)==0==1))/(a/2);
    
    familiarFP = length(FP_index(FP_index > 120 & FP_index < 241))/(b);%/120.0;
    masked_familiar_FP = length(FP_index(FP_index>120 & FP_index <241 & rem(FP_index,2)==0==0))/(b/2);
    unmasked_familiar_FP = length(FP_index(FP_index>120 & FP_index <241 & rem(FP_index,2)==0==1))/(b/2);
    
    unfamiliarFP = length(FP_index(FP_index > 240 & FP_index <361))/(c);%/120.0;
    masked_unfamiliar_FP = length(FP_index(FP_index>240 & FP_index <361 & rem(FP_index,2)==0==0))/(c/2);
    unmasked_unfamiliar_FP = length(FP_index(FP_index>240 & FP_index <361 & rem(FP_index,2)==0==1))/(c/2);
    
    % counting proportion of TN composed of famous, familiar, unfamiliar faces 
    TN_index = result_copy(tn,1,i);
    
    famousTN = length(TN_index(TN_index<121))/(a);%/120.0;
    masked_famous_TN = length(TN_index(TN_index<121 & rem(TN_index,2)==0==0))/(a/2);
    unmasked_famous_TN = length(TN_index(TN_index<121 & rem(TN_index,2)==0==1))/(a/2);
    
    familiarTN = length(TN_index(TN_index > 120 & TN_index < 241))/(b);%/120.0;
    masked_familiar_TN = length(TN_index(TN_index>120 & TN_index <241 & rem(TN_index,2)==0==0))/(b/2);
    unmasked_familiar_TN = length(TN_index(TN_index>120 & TN_index <241 & rem(TN_index,2)==0==1))/(b/2);
    
    unfamiliarTN = length(TN_index(TN_index > 240 & TN_index <361 ))/(c);%/120.0;
    masked_unfamiliar_TN = length(TN_index(TN_index>240 & TN_index <361 & rem(TN_index,2)==0==0))/(c/2);
    unmasked_unfamiliar_TN = length(TN_index(TN_index>240 & TN_index <361 & rem(TN_index,2)==0==1))/(c/2);
    
    sub_cat(i,:)=[famousTP famousFN famousFP famousTN familiarTP familiarFN familiarFP familiarTN unfamiliarTP unfamiliarFN unfamiliarFP unfamiliarTN]; 
    sub_cat_box(i,:)= [famousTP familiarTP unfamiliarTP famousFN familiarFN unfamiliarFN famousFP familiarFP unfamiliarFP famousTN familiarTN unfamiliarTN];
    sub_cat_mask(i,:) = [unmasked_famous_TP unmasked_famous_FN unmasked_famous_FP unmasked_famous_TN unmasked_familiar_TP unmasked_familiar_FN unmasked_familiar_FP unmasked_familiar_TN unmasked_unfamiliar_TP unmasked_unfamiliar_FN unmasked_unfamiliar_FP unmasked_unfamiliar_TN masked_famous_TP masked_famous_FN masked_famous_FP masked_famous_TN masked_familiar_TP masked_familiar_FN masked_familiar_FP masked_familiar_TN masked_unfamiliar_TP masked_unfamiliar_FN masked_unfamiliar_FP masked_unfamiliar_TN];
    sub_cat_mask_FP_2(i,:) = [unmasked_famous_FP unmasked_familiar_FP unmasked_unfamiliar_FP masked_famous_FP masked_familiar_FP masked_unfamiliar_FP];
    
    %category+mask wise performance:
    
%     unmasked_famous_perf = (unmasked_famous_TP*a)/(unmasked_famous_TP*a + unmasked_famous_FN*a);
%     masked_famous_perf = (masked_famous_TP*a)/(masked_famous_TP*a + masked_famous_FN*a);
%     
%     unmasked_familiar_perf = (unmasked_familiar_TP*b)/(unmasked_familiar_TP*b + unmasked_familiar_FN*b);
%     masked_familiar_perf = (masked_familiar_TP*b)/(masked_familiar_TP*b + masked_familiar_FN*b);
%     
%     unmasked_unfamiliar_perf = (unmasked_unfamiliar_TP*c)/(unmasked_unfamiliar_TP*c + unmasked_unfamiliar_FN*c);
%     masked_unfamiliar_perf = (masked_unfamiliar_TP*c)/(masked_unfamiliar_TP*c + masked_unfamiliar_FN*c);
%     
    unmasked_famous_perf = (unmasked_famous_TP)/(unmasked_famous_TP + unmasked_famous_FN);
    masked_famous_perf = (masked_famous_TP)/(masked_famous_TP + masked_famous_FN);
    
    unmasked_familiar_perf = (unmasked_familiar_TP)/(unmasked_familiar_TP + unmasked_familiar_FN);
    masked_familiar_perf = (masked_familiar_TP)/(masked_familiar_TP + masked_familiar_FN);
    
    unmasked_unfamiliar_perf = (unmasked_unfamiliar_TP)/(unmasked_unfamiliar_TP + unmasked_unfamiliar_FN);
    masked_unfamiliar_perf = (masked_unfamiliar_TP)/(masked_unfamiliar_TP + masked_unfamiliar_FN);
    
    cat_mask(i,:) = [unmasked_famous_perf unmasked_familiar_perf unmasked_unfamiliar_perf masked_famous_perf masked_familiar_perf masked_unfamiliar_perf];
    cat_mask_RT(i,:) = [unmasked_famous_RT unmasked_familiar_RT unmasked_unfamiliar_RT masked_famous_RT masked_familiar_RT masked_unfamiliar_RT];
    
   % specificity and total accuracy record-keeping
   
   UM_F_spec = (unmasked_famous_TN)/(unmasked_famous_TN + unmasked_famous_FP);
   M_F_spec = (masked_famous_TN)/(masked_famous_TN + masked_famous_FP);
   
   UM_Fa_spec = (unmasked_familiar_TN)/(unmasked_familiar_TN + unmasked_familiar_FP);
   M_Fa_spec = (masked_familiar_TN)/(masked_familiar_TN + masked_familiar_FP);
   
   UM_UF_spec = (unmasked_unfamiliar_TN)/(unmasked_unfamiliar_TN + unmasked_unfamiliar_FP);
   M_UF_spec = (masked_unfamiliar_TN)/(masked_unfamiliar_TN + masked_unfamiliar_FP);
   
   cat_mask_spec(i,:) = [UM_F_spec UM_Fa_spec UM_UF_spec M_F_spec M_Fa_spec M_UF_spec];
   
   UM_F_tacc = (unmasked_famous_TP + unmasked_famous_TN)/(unmasked_famous_TP + unmasked_famous_TN + unmasked_famous_FP + unmasked_famous_FN);
   M_F_tacc = (masked_famous_TP + masked_famous_TN)/(masked_famous_TP + masked_famous_TN + masked_famous_FP + masked_famous_FN);
   
   UM_Fa_tacc = (unmasked_familiar_TP + unmasked_familiar_TN)/(unmasked_familiar_TP + unmasked_familiar_TN + unmasked_familiar_FP + unmasked_familiar_FN);
   M_Fa_tacc = (masked_familiar_TP + masked_familiar_TN)/(masked_familiar_TP + masked_familiar_TN + masked_familiar_FP + masked_familiar_FN);
   
   UM_UF_tacc = (unmasked_unfamiliar_TP + unmasked_unfamiliar_TN)/(unmasked_unfamiliar_TP + unmasked_unfamiliar_TN + unmasked_unfamiliar_FP + unmasked_unfamiliar_FN);
   M_UF_tacc = (masked_unfamiliar_TP + masked_unfamiliar_TN)/(masked_unfamiliar_TP + masked_unfamiliar_TN + masked_unfamiliar_FP + masked_unfamiliar_FN);
   
   cat_mask_tacc(i,:) = [UM_F_tacc UM_Fa_tacc UM_UF_tacc M_F_tacc M_Fa_tacc M_UF_tacc];
    
    
    % behavioural performance analysis
    perf_table(i,1)=round(i,0);
    perf_table(i,2)=TP(1,1);
    perf_table(i,3)=masked_TP/perf_table(i,2);
    perf_table(i,4)=FN(1,1);
    perf_table(i,5)=masked_FN/perf_table(i,4);
    perf_table(i,6)=FP(1,1);
    perf_table(i,7)=masked_FP/perf_table(i,6);
    perf_table(i,8)=TN(1,1);
    perf_table(i,9)=masked_TN/perf_table(i,8);
    perf_table(i,10)=tr/(tr+fl)*100;
    
    % subject-wise familiar, famous and unfamiliar indexing
   
    
    familiar_results (:,:,i) = result_copy(familiar_index,:,i);
    unfamiliar_results (:,:,i) = result_copy(unfamiliar_index,:,i);
    famous_results (:,:,i) = result_copy(famous_index,:,i);
    
    sub_familiarTP = find(familiar_results(:,2,i)==1 & familiar_results(:,4,i)==1);
    sub_familiarFN = find(familiar_results(:,2,i)==0 & familiar_results(:,4,i)==0);
    sub_unfamiliarTP = find(unfamiliar_results(:,2,i)==1 & unfamiliar_results(:,4,i)==1);
    sub_unfamiliarFN = find(unfamiliar_results(:,2,i)==0 & unfamiliar_results(:,4,i)==0);
    sub_famousTP = find(famous_results(:,2,i)==1 & famous_results(:,4,i)==1);
    sub_famousFN = find(famous_results(:,2,i)==0 & famous_results(:,4,i)==0);
    sub_familiar_perf = length(sub_familiarTP)/(length(sub_familiarTP)+length(sub_familiarFN));
    sub_unfamiliar_perf = length(sub_unfamiliarTP)/(length(sub_unfamiliarTP)+length(sub_unfamiliarFN));
    sub_famous_perf = length(sub_famousTP)/(length(sub_famousTP)+length(sub_famousFN));
    sub_cat_results(i,:)= [sub_famous_perf*100 sub_familiar_perf*100 sub_unfamiliar_perf*100];
    
    % reaction time analysis
    sub_cat_RT(i,1)=mean(famous_results(sub_famousTP,3,i));
    sub_cat_RT(i,2)=mean(familiar_results(sub_familiarTP,3,i));
    sub_cat_RT(i,3)=mean(unfamiliar_results(sub_unfamiliarTP,3,i));
    
    % reaction time wrt mask condition
    sub_mask_RT (i,1) = mean(result_copy(M_tp,3,i));
    sub_mask_RT (i,2) = mean(result_copy(UM_tp,3,i));
end

f1 = strcat(file_path,'Performance Accuracy');
f2 = strcat(file_path, 'Reaction Time');
save(f1, 'cat_mask');
save(f2, 'cat_mask_RT');

f3 = strcat(file_path,'Specificity');
f4 = strcat(file_path, 'Total Accuracy');
save(f3, 'cat_mask_spec');
save(f4, 'cat_mask_tacc');

%subject_ID = {'1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; '10'; '11'; '12'; '13'; '14'; '15'; '16'; '17'; '18'; '19'; '20'; '21'; '22'; '23'; '24';'25';'26';'27';'28';'29';'30';'31';'32';'33';'34';'35';'36';'37';'38';'39';'40';'41'};
%subject_ID = {'1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; '10'; '11'; '12'; '13'; '14';'15';'16';'17'; '18'; '19'; '20';'21';'22';'23';'24';'25';'26';'27'; '28';'29';'30';'31';'32';'33';'34';'35'};
%subject_ID = {'1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; '10'; '11'; '12'; '13'; '14';'15';'16';'17'; '18'; '19'; '20';'21';'22';'23';'24';'25';'26';'27'; '28';'29';'30';'31';'32';'33'};
subject_ID = {'1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; '10'; '11'; '12'; '13'; '14'; '15'; '16'; '17'; '18'; '19'; '20'; '21'; '22'; '23'; '24';'25';'26';'27';'28';'29';'30';'31';'32';'33';'34';'35';'36'};
TruePos = perf_table(:,2);
MaskedTP = perf_table(:,3);
FalseNeg = perf_table(:,4);
MaskedFN = perf_table(:,5);
FalsePos = perf_table(:,6);
MaskedFP = perf_table(:,7);
TrueNeg = perf_table(:,8);
MaskedTN = perf_table(:,9);
Perf_Accuracy = perf_table(:,10);
T = table (subject_ID, TruePos, MaskedTP, FalseNeg, MaskedFN, FalsePos, MaskedFP, TrueNeg, MaskedTN, Perf_Accuracy)
avg_performance = mean(perf_table(:,10))
median_performance = median(perf_table(:,10))

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
