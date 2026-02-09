% performing paired t-test for 
load 'N250_left.mat'

%column numbers of t-test comparison
y = erpval(:,[1 2]);
X1 = y(:,1); 
X2 = y(:,2); 
[h,p,ci,stats] = ttest(X1,X2,'Tail', 'right');
pval = p

d = computeCohen_d(X1,X2,'paired')

