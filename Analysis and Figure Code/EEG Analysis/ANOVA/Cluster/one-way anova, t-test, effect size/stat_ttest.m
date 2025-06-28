% performing paired t-test for 
load 'N250_PO8_correct_task_rejected_familiar_check.mat'

%column numbers of t-test comparison
y = erp_values(:,[1 2]);
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
[h,p,ci,stats] = ttest(X1,X2,'Tail', 'right');
pval = p
d = computeCohen_d(X1,X2,'paired')