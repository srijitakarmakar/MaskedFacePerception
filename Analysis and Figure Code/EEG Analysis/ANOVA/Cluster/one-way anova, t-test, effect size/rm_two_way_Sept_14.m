% two-way anova with hemisphere as a factor: Sept 14 2022

load('N250_left.mat') % left hemisphere
[n,c2] = size(erpval);
data_left = erpval(:,[1 4]); % famous
%data_left = erpval(:,[2 5]); % familiar

load('N250_right.mat') % right hemisphere
[m,c4] = size(erpval);
data_right = erpval(:,[1 4]);
%data_right = erpval(:,[2 5]); % familiar

erpval = horzcat(data_right, data_left);

varNames = cell(2*2,1);
for i = 1 : 2*2
 v = strcat('V',num2str(i));
 varNames{i,1} = v;
end
% Create a table storing the respones
tbiases = array2table(erpval, 'VariableNames',varNames);

% Create a table reflecting the within subject factors
Hemi = cell(2*2,1); % hemisphere
Mask = cell(2*2,1); % mask conditions

c1 = cell(1,1); c1{1} = 'R'; c1 = repmat(c1,2,1); Hemi(1:2,1) = c1;
c1 = cell(1,1); c1{1} = 'L'; c1 = repmat(c1,2,1); Hemi(3:end,1) = c1;
c1 = cell(1,1); c1{1} = 'UM'; c1 = repmat(c1,2,1); Mask(1:2:end,1) = c1;
c1 = cell(1,1); c1{1} = 'M'; c1 = repmat(c1,2,1); Mask(2:2:end,1) = c1;

% Create the within table
factorNames = {'Mask','Hemi'};
within = table(Mask, Hemi, 'VariableNames', factorNames);

% fit the repeated measures model
rm = fitrm(tbiases,'V1-V4~1','WithinDesign',within);
[ranovatblb] = ranova(rm, 'WithinModel','Mask*Hemi');

Mrm1 = multcompare(rm,'Hemi','By','Mask','ComparisonType','hsd');

Mrm2 = multcompare(rm,'Mask','By','Hemi','ComparisonType','hsd');

