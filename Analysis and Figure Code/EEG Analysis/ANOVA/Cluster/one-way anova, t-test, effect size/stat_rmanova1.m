%one-way rm anova stat, using function RMAOV1(X,alpha)
load 'N250_both.mat'
%removing NaN valued subjects
y = erpvalues;
[n,c2] = size(y);

%column numbers for categories tested using one-way anova
%col1: UM F / col2: UM Fa / col3: UM UF / col4: M F / col5: M Fa / col6: M UF
y_anova = y(:,[3 6]); 

Y = y_anova(:); % dependent variable

S=[1:n 1:n]'; % subjects for UM vs M
%S=[1:n 1:n 1:n]'; % subjects for F vs Fa vs UF

IV = [ones(n,1); 2*ones(n,1)]; % independent variable for UM vs M
%IV=[ones(n,1); 2*ones(n,1); 3*ones(n,1)]; % independent variable for F vs Fa vs UF

X = horzcat(Y,IV,S);
alpha = 0.05;

RMAOV1(X,alpha);
