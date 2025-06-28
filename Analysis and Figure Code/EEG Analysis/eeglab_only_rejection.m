% only epochrej using eeglab

function eeglab_only_rejection (subject)

path_file = 'E:\\Srijita\\Data Files\\Behavior Pilots\\2-back\\Unfamiliar-constant (new analysis, Jan 22)\\EEG Analysis\\';
path_save = 'E:\\Srijita\\Data Files\\Behavior Pilots\\2-back\\Unfamiliar-constant (new analysis, Jan 22)\\EEG Analysis\\';

% path_file = 'E:\\Srijita\\Data Files\\EEG Pilots\\Classification\\Famous male vs female\\famous male vs female data - before rejection\\';
% path_save = 'E:\\Srijita\\Data Files\\EEG Pilots\\Classification\\Famous male vs female\\famous male vs female data - after rejection\\';
for i = 1:6 % to loop over preprocessing for each of the 6 categories per subject

if i == 1 % unmasked_familiar
file_name = strcat(path_file,subject,'_unmasked_familiar_eeg.mat');
save_name = strcat(path_save,subject,'_UM_Fa_only_epochrej_new.mat');
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_importdata('dataformat','matlab','nbchan',0,'data',file_name,'srate',512,'pnts',0,'xmin',0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname',save_name,'gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_editset(EEG, 'xmin', [-0.2]);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
EEG=pop_chanedit(EEG, 'lookup','E:\\Srijita\\Data Files\\EEG Pilots\\eeglab2019_0\\plugins\\dipfit\\standard_BESA\\standard-10-5-cap385.elp','load',{'E:\\Srijita\\Data Files\\EEG Pilots\\64(mod) (1).ced' 'filetype' 'autodetect'});
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
EEG = eeg_checkset( EEG );

%interpolating Fp1 only for Rohan, Rupam, Gaurab, Apurba
if strcmp(subject,'rohan')==1 || strcmp(subject,'rupam')==1 || strcmp(subject,'gaurab')==1 || strcmp(subject,'apurba')==1   
EEG = pop_interp(EEG, [1], 'spherical');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'overwrite','on','gui','off'); 
end
%EEG = pop_eegfiltnew(EEG, 'locutoff',0.1,'hicutoff',40,'plotfreqz',1);
%[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
%EEG = eeg_checkset( EEG );
%EEG = pop_reref( EEG, []);
%[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2, 'gui','off'); 
%EEG = eeg_checkset( EEG );
%EEG = pop_rmbase( EEG, [],[1:102] );
%[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'gui','off'); 
%EEG = eeg_checkset( EEG );
%EEG = pop_firma(EEG, 'forder', 6);
%[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 4,'gui','off'); 
%EEG = eeg_checkset( EEG );
EEG = pop_autorej(EEG, 'nogui','on','startprob',5,'maxrej',5,'eegplot','off');
%EEG = pop_autorej(EEG, 'nogui','on','eegplot','on');
%EEG = pop_rejepoch( EEG, 23,0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1, 'gui','off'); 
eeglab redraw;
A = EEG.data;
save(save_name,'A');
    
elseif i == 2 % unmasked famous
        
file_name = strcat(path_file,subject,'_unmasked_famous_eeg.mat');
save_name = strcat(path_save,subject,'_UM_F_only_epochrej_new.mat');
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_importdata('dataformat','matlab','nbchan',0,'data',file_name,'srate',512,'pnts',0,'xmin',0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname',save_name,'gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_editset(EEG, 'xmin', [-0.2]);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
EEG=pop_chanedit(EEG, 'lookup','E:\\Srijita\\Data Files\\EEG Pilots\\eeglab2019_0\\plugins\\dipfit\\standard_BESA\\standard-10-5-cap385.elp','load',{'E:\\Srijita\\Data Files\\EEG Pilots\\64(mod) (1).ced' 'filetype' 'autodetect'});
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
EEG = eeg_checkset( EEG );
% EEG = pop_eegfiltnew(EEG, 'locutoff',0.1,'hicutoff',40,'plotfreqz',1);
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
% EEG = eeg_checkset( EEG );
% EEG = pop_reref( EEG, []);
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2, 'gui','off'); 
% EEG = eeg_checkset( EEG );
% EEG = pop_rmbase( EEG, [],[1:102] );
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'gui','off'); 
% EEG = eeg_checkset( EEG );
% EEG = pop_firma(EEG, 'forder', 6);
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 4,'gui','off'); 

%interpolating Fp1 only for Rohan, Rupam, Gaurab, Apurba
if strcmp(subject,'rohan')==1 || strcmp(subject,'rupam')==1 || strcmp(subject,'gaurab')==1 || strcmp(subject,'apurba')==1   
EEG = pop_interp(EEG, [1], 'spherical');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'overwrite','on','gui','off'); 
end

EEG = pop_autorej(EEG, 'nogui','on','startprob',5,'maxrej',5,'eegplot','off');
%EEG = pop_autorej(EEG, 'nogui','on','eegplot','on');
%EEG = pop_rejepoch( EEG, 23,0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1, 'gui','off'); 
eeglab redraw;
A = EEG.data;
save(save_name,'A');

elseif i == 3 % unmasked unfamiliar

file_name = strcat(path_file,subject,'_unmasked_unfamiliar_eeg.mat');
save_name = strcat(path_save,subject,'_UM_UF_only_epochrej_new.mat');
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_importdata('dataformat','matlab','nbchan',0,'data',file_name,'srate',512,'pnts',0,'xmin',0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname',save_name,'gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_editset(EEG, 'xmin', [-0.2]);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
EEG=pop_chanedit(EEG, 'lookup','E:\\Srijita\\Data Files\\EEG Pilots\\eeglab2019_0\\plugins\\dipfit\\standard_BESA\\standard-10-5-cap385.elp','load',{'E:\\Srijita\\Data Files\\EEG Pilots\\64(mod) (1).ced' 'filetype' 'autodetect'});
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
EEG = eeg_checkset( EEG );
% EEG = pop_eegfiltnew(EEG, 'locutoff',0.1,'hicutoff',40,'plotfreqz',1);
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
% EEG = eeg_checkset( EEG );
% EEG = pop_reref( EEG, []);
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2, 'gui','off'); 
% EEG = eeg_checkset( EEG );
% EEG = pop_rmbase( EEG, [],[1:102] );
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'gui','off'); 
% EEG = eeg_checkset( EEG );
% EEG = pop_firma(EEG, 'forder', 6);
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 4,'gui','off'); 

%interpolating Fp1 only for Rohan, Rupam, Gaurab, Apurba
if strcmp(subject,'rohan')==1 || strcmp(subject,'rupam')==1 || strcmp(subject,'gaurab')==1 || strcmp(subject,'apurba')==1   
EEG = pop_interp(EEG, [1], 'spherical');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'overwrite','on','gui','off'); 
end

EEG = pop_autorej(EEG, 'nogui','on','startprob',5,'maxrej',5,'eegplot','off');
%EEG = pop_autorej(EEG, 'nogui','on','eegplot','on');
%EEG = pop_rejepoch( EEG, 23,0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1, 'gui','off'); 
eeglab redraw;
A = EEG.data;
save(save_name,'A');
    
elseif i == 4 % masked familiar
        
file_name = strcat(path_file,subject,'_masked_familiar_eeg.mat');
save_name = strcat(path_save,subject,'_M_Fa_only_epochrej_new.mat');
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_importdata('dataformat','matlab','nbchan',0,'data',file_name,'srate',512,'pnts',0,'xmin',0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname',save_name,'gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_editset(EEG, 'xmin', [-0.2]);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
EEG=pop_chanedit(EEG, 'lookup','E:\\Srijita\\Data Files\\EEG Pilots\\eeglab2019_0\\plugins\\dipfit\\standard_BESA\\standard-10-5-cap385.elp','load',{'E:\\Srijita\\Data Files\\EEG Pilots\\64(mod) (1).ced' 'filetype' 'autodetect'});
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
EEG = eeg_checkset( EEG );
% EEG = pop_eegfiltnew(EEG, 'locutoff',0.1,'hicutoff',40,'plotfreqz',1);
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
% EEG = eeg_checkset( EEG );
% EEG = pop_reref( EEG, []);
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2, 'gui','off'); 
% EEG = eeg_checkset( EEG );
% EEG = pop_rmbase( EEG, [],[1:102] );
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'gui','off'); 
% EEG = eeg_checkset( EEG );
% EEG = pop_firma(EEG, 'forder', 6);
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 4,'gui','off'); 

%interpolating Fp1 only for Rohan, Rupam, Gaurab, Apurba
if strcmp(subject,'rohan')==1 || strcmp(subject,'rupam')==1 || strcmp(subject,'gaurab')==1 || strcmp(subject,'apurba')==1   
EEG = pop_interp(EEG, [1], 'spherical');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'overwrite','on','gui','off'); 
end
EEG = pop_autorej(EEG, 'nogui','on','startprob',5,'maxrej',5,'eegplot','off');
%EEG = pop_autorej(EEG, 'nogui','on','eegplot','on');
%EEG = pop_rejepoch( EEG, 23,0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1, 'gui','off'); 
eeglab redraw;
A = EEG.data;
save(save_name,'A');

elseif i == 5 % masked famous
    
file_name = strcat(path_file,subject,'_masked_famous_eeg.mat');
save_name = strcat(path_save,subject,'_M_F_only_epochrej_new.mat');
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_importdata('dataformat','matlab','nbchan',0,'data',file_name,'srate',512,'pnts',0,'xmin',0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname',save_name,'gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_editset(EEG, 'xmin', [-0.2]);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
EEG=pop_chanedit(EEG, 'lookup','E:\\Srijita\\Data Files\\EEG Pilots\\eeglab2019_0\\plugins\\dipfit\\standard_BESA\\standard-10-5-cap385.elp','load',{'E:\\Srijita\\Data Files\\EEG Pilots\\64(mod) (1).ced' 'filetype' 'autodetect'});
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
EEG = eeg_checkset( EEG );
% EEG = pop_eegfiltnew(EEG, 'locutoff',0.1,'hicutoff',40,'plotfreqz',1);
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
% EEG = eeg_checkset( EEG );
% EEG = pop_reref( EEG, []);
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2, 'gui','off'); 
% EEG = eeg_checkset( EEG );
% EEG = pop_rmbase( EEG, [],[1:102] );
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'gui','off'); 
% EEG = eeg_checkset( EEG );
% EEG = pop_firma(EEG, 'forder', 6);
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 4,'gui','off');

%interpolating Fp1 only for Rohan, Rupam, Gaurab, Apurba
if strcmp(subject,'rohan')==1 || strcmp(subject,'rupam')==1 || strcmp(subject,'gaurab')==1 || strcmp(subject,'apurba')==1   
EEG = pop_interp(EEG, [1], 'spherical');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'overwrite','on','gui','off'); 
end
EEG = pop_autorej(EEG, 'nogui','on','startprob',5,'maxrej',5,'eegplot','off');
%EEG = pop_autorej(EEG, 'nogui','on','eegplot','on');
%EEG = pop_rejepoch( EEG, 23,0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1, 'gui','off'); 
eeglab redraw;
A = EEG.data;
save(save_name,'A');
            
elseif i == 6 % masked unfamiliar

file_name = strcat(path_file,subject,'_masked_unfamiliar_eeg.mat');
save_name = strcat(path_save,subject,'_M_UF_only_epochrej_new.mat');
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_importdata('dataformat','matlab','nbchan',0,'data',file_name,'srate',512,'pnts',0,'xmin',0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname',save_name,'gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_editset(EEG, 'xmin', [-0.2]);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
EEG=pop_chanedit(EEG, 'lookup','E:\\Srijita\\Data Files\\EEG Pilots\\eeglab2019_0\\plugins\\dipfit\\standard_BESA\\standard-10-5-cap385.elp','load',{'E:\\Srijita\\Data Files\\EEG Pilots\\64(mod) (1).ced' 'filetype' 'autodetect'});
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
EEG = eeg_checkset( EEG );
% EEG = pop_eegfiltnew(EEG, 'locutoff',0.1,'hicutoff',40,'plotfreqz',1);
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
% EEG = eeg_checkset( EEG );
% EEG = pop_reref( EEG, []);
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2, 'gui','off'); 
% EEG = eeg_checkset( EEG );
% EEG = pop_rmbase( EEG, [],[1:102] );
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'gui','off'); 
% EEG = eeg_checkset( EEG );
% EEG = pop_firma(EEG, 'forder', 6);
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 4,'gui','off'); 

%interpolating Fp1 only for Rohan, Rupam, Gaurab, Apurba
if strcmp(subject,'rohan')==1 || strcmp(subject,'rupam')==1 || strcmp(subject,'gaurab')==1 || strcmp(subject,'apurba')==1   
EEG = pop_interp(EEG, [1], 'spherical');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'overwrite','on','gui','off'); 
end
EEG = pop_autorej(EEG, 'nogui','on','startprob',5,'maxrej',5,'eegplot','off');
%EEG = pop_autorej(EEG, 'nogui','on','eegplot','on');
%EEG = pop_rejepoch( EEG, 23,0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1, 'gui','off'); 
eeglab redraw;
A = EEG.data;
save(save_name,'A');

end
end
end