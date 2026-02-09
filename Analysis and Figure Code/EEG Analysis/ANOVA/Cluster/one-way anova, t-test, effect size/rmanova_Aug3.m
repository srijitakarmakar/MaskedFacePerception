load('N250_both.mat')
[n,c2] = size(erpval);

varNames = cell(3*2,1);
for i = 1 : 3*2
 v = strcat('V',num2str(i));
 varNames{i,1} = v;
end
% Create a table storing the respones
tbiases = array2table(erpval, 'VariableNames',varNames);

% Create a table reflecting the within subject factors
Fam = cell(3*2,1); % familiarity conditions
Mask = cell(3*2,1); % mask conditions
%OPs = cell(3*5*2,1); % Obstacle Positions

c1 = cell(1,1); c1{1} = 'UM'; c1 = repmat(c1,3,1); Mask(1: 3,1) = c1;
c1 = cell(1,1); c1{1} = 'M'; c1 = repmat(c1,3,1); Mask(4: end,1) = c1;
c1 = cell(1,1); c1{1} = 'F'; c1 = repmat(c1,2,1); Fam(1:3:end,1) = c1;
c1 = cell(1,1); c1{1} = 'Fa'; c1 = repmat(c1,2,1); Fam(2:3:end,1) = c1;
c1 = cell(1,1); c1{1} = 'UF'; c1 = repmat(c1,2,1); Fam(3:3:end,1) = c1;

% Create the within table
factorNames = {'Familiarity','Mask'};
within = table(Fam, Mask, 'VariableNames', factorNames);

% fit the repeated measures model
rm = fitrm(tbiases,'V1-V6~1','WithinDesign',within);
[ranovatblb] = ranova(rm, 'WithinModel','Familiarity*Mask');

Mrm1 = multcompare(rm,'Familiarity','By','Mask','ComparisonType','hsd');

Mrm2 = multcompare(rm,'Mask','By','Familiarity','ComparisonType','hsd');
