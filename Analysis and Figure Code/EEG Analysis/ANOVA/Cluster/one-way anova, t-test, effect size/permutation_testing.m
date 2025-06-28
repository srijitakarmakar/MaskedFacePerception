% mdodified t-statistic with median absolute deviation as an estimate of SD
% permutation testing to get distribution

load 'N250_PO4_correct_task.mat'
y = erp_values(:,[2 5]); % cols to be tested

% removing NaN containing subjects
N = 20;
a = isnan(y);
f = find(a==1);
%[r,c1]=ind2sub([N,6],f);
[r,c1]=ind2sub([N,2],f);
y_copy = y;
y(r,:)=[];
X1 = y(:,1);
X2 = y(:,2);
[n1,~] = size(X1);
[n2,~] = size(X2);
mu1 = mean(X1);
mu2 = mean(X2);
mad1 = mad(X1);
mad2 = mad(X2);
% mad1 = std(X1);
% mad2 = std(X2);
de = sqrt(abs((mad1^2/n1)-(mad2^2)/n2));
t_obs = (mu1-mu2)/de;
iter = 50000;
data = y(:);
% label1 = zeros(n1,1);
% label2 = ones(n2,1);
% Label = vertcat(label1,label2);
% Data = horzcat(data, Label);
flag = 0;
counter = 0;
dist = zeros(1,1);
for i = 1:iter
    [new_X1,idx1] = datasample(data,n1,'Replace', false);
    idx2 = setdiff(1:(n1+n2),idx1,'stable');
    new_X2 = data(idx2);
    new_X2 = shuffle(new_X2);
    mu1 = mean(new_X1);
    mu2 = mean(new_X2);
    mad1 = mad(new_X1);
    mad2 = mad(new_X2);
%     mad1 = std(new_X1);
%     mad2 = std(new_X2);
    de = sqrt(abs((mad1^2/n1)-(mad2^2)/n2));
    t_calc = (mu1-mu2)/de;
    dist(i)=t_calc;
    %if t_obs<t_calc % for P200
    if t_obs>t_calc % for N170, N250
        flag = flag+1;
    end
    counter = counter+1
end
%dist(1)=[];
histogram(dist)
%[h,p,ci,stats] = ttest(X1,X2);
pval = flag/iter % p-value corresponding to the null hypothesis