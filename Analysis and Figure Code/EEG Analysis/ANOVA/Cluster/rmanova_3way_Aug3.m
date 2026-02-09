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
Mask = cell(2*3*2,1); % mask conditions

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
Mrm1 = multcompare(rm,'Familiarity','By','Mask','ComparisonType','hsd');
Mrm2 = multcompare(rm,'Mask','By','Familiarity','ComparisonType','hsd');
Mrm3 = multcompare(rm,'Familiarity','By','Hemi','ComparisonType','hsd');
Mrm4 = multcompare(rm,'Hemi','By','Familiarity','ComparisonType','hsd');
Mrm5 = multcompare(rm,'Hemi','By','Mask','ComparisonType','hsd');
Mrm6 = multcompare(rm,'Mask','By','Hemi','ComparisonType','hsd');

% three way comparison
withins2 = within;
withins2.Familiarity = categorical(withins2.Familiarity);
withins2.Mask = categorical(withins2.Mask);
withins2.Hemi = categorical(withins2.Hemi);
withins2.Fam_Mask = withins2.Familiarity .* withins2.Mask;
%%run my repeated measures anova for Directional Biases
rm = fitrm(tbiases,'V1-V12~1','WithinDesign',withins2); % overal fit
%[ranovatblb] = ranova(rm, 'WithinModel', 'Familiarity*Mask*Hemi');
 
%Mrm4 = multcompare(rm,'HRs','By','ObstaclePos');
Mrm7 = multcompare(rm,'Fam_Mask','By','Hemi');
Mrm8 = multcompare(rm,'Hemi','By','Fam_Mask');


% three way comparison
withins3 = within;
withins3.Familiarity = categorical(withins3.Familiarity);
withins3.Mask = categorical(withins3.Mask);
withins3.Hemi = categorical(withins3.Hemi);
withins3.Hemi_Fam = withins3.Hemi .* withins3.Familiarity;
%%run my repeated measures anova for Directional Biases
rm = fitrm(tbiases,'V1-V12~1','WithinDesign',withins3); % overal fit
%[ranovatblb] = ranova(rm, 'WithinModel', 'Familiarity*Mask*Hemi');
 
%Mrm4 = multcompare(rm,'HRs','By','ObstaclePos');
Mrm9 = multcompare(rm,'Hemi_Fam','By','Mask');
Mrm10 = multcompare(rm,'Mask','By','Hemi_Fam');

% three way comparison
withins4 = within;
withins4.Familiarity = categorical(withins4.Familiarity);
withins4.Mask = categorical(withins4.Mask);
withins4.Hemi = categorical(withins4.Hemi);
withins4.Hemi_Mask = withins4.Hemi .* withins4.Mask;
%%run my repeated measures anova for Directional Biases
rm = fitrm(tbiases,'V1-V12~1','WithinDesign',withins4); % overal fit
%[ranovatblb] = ranova(rm, 'WithinModel', 'Familiarity*Mask*Hemi');
 
%Mrm4 = multcompare(rm,'HRs','By','ObstaclePos');
Mrm11 = multcompare(rm,'Hemi_Mask','By','Familiarity');

Mrm12 = multcompare(rm,'Familiarity','By','Hemi_Mask');
