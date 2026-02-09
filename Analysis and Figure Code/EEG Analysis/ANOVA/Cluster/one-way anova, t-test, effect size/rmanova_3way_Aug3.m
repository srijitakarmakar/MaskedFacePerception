%Biases = rand(20,2*3*2); % subjects, Hemi*Mask*Fam
load('N250_left.mat') % left
A = erp_values;
load('N250_right.mat') % right
B = erp_values;
erpval = horzcat(A,B);
[n,c2] = size(erpval);

varNames = cell(2*3*2,1);
for i = 1 : 2*3*2
 v = strcat('V',num2str(i));
 varNames{i,1} = v;
end
% Create a table storing the respones
tbiases = array2table(erpval, 'VariableNames',varNames);

% Create a table reflecting the within subject factors
Hemi = cell(2*3*2,1); % hemisphere conditions
Fam = cell(2*3*2,1); % familiarity conditions
Mask = cell(2*3*2,1); % mask Positions

% Assiging the values to the parameters based on the data sorting
c1 = cell(1,1); c1{1} = 'L'; c1 = repmat(c1,6,1); Hemi(1: 6,1) = c1;
c1 = cell(1,1); c1{1} = 'R'; c1 = repmat(c1,6,1); Hemi(7: end,1) = c1;
c1 = cell(1,1); c1{1} = 'F'; c1 = repmat(c1,4,1); Fam(1:3:end,1) = c1;
c1 = cell(1,1); c1{1} = 'Fa'; c1 = repmat(c1,4,1); Fam(2:3:end,1) = c1;
c1 = cell(1,1); c1{1} = 'UF'; c1 = repmat(c1,4,1); Fam(3:3:end,1) = c1;
for i = 1 : 2
    if i == 1
        o = 'UM';
    else
        o = 'M';
    end
 %o = strcat('O',num2str(i));
 c1 = cell(1,1); c1{1} = o; c1 = repmat(c1,3,1); Mask((i-1)*3+1:i*3,1) = c1;
end
Mask(7:end,1) = Mask(1:6,1);

% Create the within table
factorNames = {'Hemi','Familiarity', 'Mask'};
within = table(Hemi, Fam, Mask, 'VariableNames', factorNames);
% fit the repeated measures model
rm = fitrm(tbiases,'V1-V12~1','WithinDesign',within);
[ranovatblb] = ranova(rm, 'WithinModel','Hemi*Familiarity*Mask');

% two way comparison
Mrm1 = multcompare(rm,'Familiarity','By','Mask','ComparisonType','bonferroni');
Mrm2 = multcompare(rm,'Familiarity','By','Hemi','ComparisonType','bonferroni');
Mrm3 = multcompare(rm,'Hemi','By','Mask','ComparisonType','bonferroni');

% three way comparison
withins2 = within;
withins2.Familiarity = categorical(withins2.Familiarity);
withins2.Mask = categorical(withins2.Mask);
withins2.Hemi = categorical(withins2.Hemi);
withins2.Fam_Mask = withins2.Familiarity .* withins2.Mask;
%%run my repeated measures anova for Directional Biases
rm = fitrm(tbiases,'V1-V12~1','WithinDesign',withins2); % overal fit
[ranovatblb] = ranova(rm, 'WithinModel', 'Familiarity*Mask*Hemi');
 
%Mrm4 = multcompare(rm,'HRs','By','ObstaclePos');
Mrm4 = multcompare(rm,'Fam_Mask','By','Hemi');

Mrm6 = multcompare(rm,'Hemi','By','Fam_Mask');
