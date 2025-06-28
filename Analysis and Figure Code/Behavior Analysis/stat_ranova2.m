%stats %
%2way repeated measures anova

% load 'Reaction Time.mat';
% Y=cat_mask_RT(:);
load 'Performance Accuracy.mat';
%cat_mask_RT = cat_mask_RT(1:end-1,:);
Y=cat_mask(:);
% load 'FP.mat';
% %y = sub_cat_mask_TN;
% Y = sub_cat_mask_FP(:);

% load 'Specificity.mat'
% Y = cat_mask_spec(:);

% load 'Total Accuracy.mat'
% Y = cat_mask_tacc(:);

n = 36;
S=[1:n 1:n 1:n 1:n 1:n 1:n]';
F1=[ones(n,1); 2*ones(n,1); 3*ones(n,1) ;ones(n,1) ;2*ones(n,1); 3*ones(n,1)];
F2=[ones(n*3,1); 2*ones(n*3,1) ] ;
cat={'famous','familiar','unfamiliar'};
cond={'unmasked', 'masked'};
FACTNAMES={cat, cond};
st=rm_anova2(Y,S,F1,F2, FACTNAMES)
