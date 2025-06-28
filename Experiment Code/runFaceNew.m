function runFaceNew()

% to experimental trials via face_exp_new(...), to practice session via practice_face_new(...)
sca;
close all;
clearvars; 

if strcmp(computer,'PCWIN')
     warning off MATLAB:DeprecatedLogicalAPI;
end
 
% check for Opengl compatibility, abort otherwise:
AssertOpenGL;

h = IOPort('OpenSerialPort', 'com3','BaudRate=19200');
IOPort('Write', h, 'a');

% participant details

KbName('UnifyKeyNames');
prompt = {'Enter your name:','Enter Roll No.:'};
dlgtitle = 'Requesting Participant Info'; 
dims = [1 35];
%definput = {'20','hsv'};
answer = inputdlg(prompt,dlgtitle,dims);
drawnow;
[subject,roll]=deal(answer{:});
%age=str2double(age);

pth1='C:/Users/Dr. Koel Das/Documents/MATLAB/Srijita/Stim_test_SK/New Paradigm/datafiles/'; % need to include final \
pth3=strcat(pth1,subject,'/*.mat');

%===========GUI===========
% Construct a questdlg with three options
if exist(['C:/Users/Dr. Koel Das/Documents/MATLAB/Srijita/Stim_test_SK/New Paradigm/datafiles/' subject],'dir')
choice = questdlg('File of this user name already exists ? Would you like to overwrite?', ...
	'input', ...
	'ok','change name','no','no');
% Handle response
switch choice
    case 'ok'
        disp(['User Entered ' choice ' .Overwrite confirmed.']);
        delete(pth3);
    case 'change name'
        disp(['User Entered ' choice ' .Name Changed']);
          prompt1 = {'Please Enter Another Name: ', 'Roll No.: '};
          %defaults1 ={'name'};
          answer1=inputdlg(prompt1,'Changed Information',[1 50]);
          drawnow;
          [subject, roll]=deal(answer1{:});
    
    case 'no'
        disp(['User Entered ' choice ' . Experiment Stopped'])
        return;
%     case 'No thank you'
%         disp('I'll bring you your check.')
%         dessert = 0;
end
end
mkdir(pth1,subject);
pth=strcat(pth1,subject,'\');
 
%Index_Matrix = [32	133	222	205	314	17	324	76	332	173	72	337	38	325	299	146	350	9	212	263	59	191	105	164; 294	359	31	176	217	48	134	153	331	114	237	273	68	265	21	282	229	43	98	67	304	198	238	338; 160	80	180	241	308	143	93	25	94	227	209	297	353	122	85	4	345	302	3	280	186	149	284	108; 100	140	181	151	330	88	358	6	335	124	71	269	63	255	300	188	339	44	197	260	95	145	119	220; 56	148	185	169	290	74	348	20	327	152	65	259	49	245	258	224	355	8	193	296	33	161	111	206; 2	166	182	139	292	110	344	24	283	172	41	295	27	253	320	183	357	84	199	274	89	157	115	232; 178	113	147	75	242	215	12	343	218	306	101	275	267	103	156	333	102	352	34	328	131	187	138	106; 340	16	137	319	126	70	341	189	117	30	334	298	51	315	226	112	61	351	163	200	175	81	128	270; 82	29	211	54	289	288	1	208	249	109	135	42	194	159	168	266	243	201	278	79	310	170	46	301; 329	223	257	35	184	11	22	190	347	272	354	346	107	55	246	116	165	303	26	154	78	150	231	239; 291	305	228	322	69	141	136	40	123	250	120	240	45	221	286	23	92	15	271	216	316	203	349	66; 60	247	268	167	18	73	99	252	83	307	104	326	313	195	210	236	321	171	225	97	86	162	262	230; 57	261	342	47	254	192	244	279	158	36	118	214	233	251	28	174	13	129	19	177	336	62	309	235; 5	360	14	318	202	155	64	281	77	87	144	276	317	52	132	10	248	207	287	125	219	311	37	196; 96	50	90	53	323	285	312	142	58	264	356	277	130	213	127	256	121	234	179	39	293	91	7	204]; % pseudo-random image sequence, each row for a block
%Practice_Matrix = [362 375 367 370 363 376 377 374 369 371 361 365];
%Index_Matrix = [32	133	222	135	175	314	17	318	246	76	342	173	72	337	68	38	325	277	327	146	350	31	59	35	263	212	191	214	105	164; 294	359	31	176	183	180	48	134	44	114	331	153	238	151	273	68	265	98	267	282	21	304	23	229	67	43	340	121	338	198; 160	80	162	180	241	93	243	143	308	25	310	94	4	96	209	297	353	122	85	227	345	223	302	3	280	5	186	149	284	108; 6	144	330	140	151	181	88	185	358	100	63	102	124	71	269	335	255	333	300	188	296	339	44	197	260	95	145	119	220	115; 22	148	193	152	290	154	74	111	76	20	327	169	65	276	61	49	259	245	263	224	355	8	183	296	185	33	161	348	206	344; 2	166	182	164	139	344	110	292	24	294	283	172	41	295	27	157	25	320	217	357	219	84	199	80	274	89	253	115	255	232; 178	113	147	12	149	242	215	75	343	77	218	306	101	275	267	271	103	156	333	102	352	34	354	328	187	131	189	106	138	104; 340	16	137	18	319	126	339	189	341	70	117	30	270	298	268	226	53	315	51	112	61	334	207	200	205	163	81	128	351	130; 82	288	211	284	289	29	1	54	208	249	109	135	111	159	40	184	42	168	199	243	201	266	278	174	310	170	303	46	301	79; 329	223	325	257	231	194	11	196	347	58	190	56	272	354	346	107	53	324	116	322	165	303	163	26	154	78	150	35	239	33; 291	305	228	322	224	69	141	136	143	40	15	250	17	120	240	45	221	92	288	23	286	123	271	216	273	316	203	66	349	62; 60	247	268	167	97	73	99	18	252	83	307	104	309	326	313	195	210	236	208	321	171	225	173	97	86	162	88	262	230	260; 57	334	261	332	47	254	192	244	279	177	281	36	118	233	214	231	287	28	13	174	15	129	19	158	336	160	235	64	309	66; 5	360	3	14	318	202	155	200	64	281	77	87	144	258	317	254	12	132	10	52	248	247	207	251	311	219	125	37	123	196; 50	96	54	90	55	323	285	312	142	310	58	299	356	295	264	130	213	127	235	256	237	293	179	234	39	230	91	7	204	9; 291	305	228	322	224	69	141	136	143	40	15	250	17	120	240	45	221	92	288	23	286	123	271	216	273	316	204	66	350	62];
Index_Matrix = [32	133	191	135	175	314	17	318	246	76	342	173	72	337	68	38	325	204	327	146	105	31	59	35	263	212	277	214	350	164; 294	359	31	176	187	180	48	134	44	114	331	153	238	151	273	68	265	98	267	282	21	304	23	229	67	43	340	121	338	198; 160	80	162	180	241	93	243	143	308	25	310	94	4	96	209	297	353	122	85	227	345	223	302	3	280	5	178	149	284	108; 6	144	330	140	151	181	88	185	358	100	63	102	124	71	269	335	255	333	300	188	296	339	44	197	260	95	145	119	220	115; 22	148	193	152	290	154	74	111	76	20	327	169	65	276	61	49	259	245	263	224	355	8	183	296	185	33	161	348	206	344; 2	166	182	164	139	344	110	292	24	294	283	172	41	295	27	157	25	320	217	357	219	84	199	80	274	89	253	115	255	232; 186	113	147	12	149	242	215	75	343	77	218	306	101	275	267	271	103	156	333	102	352	34	354	328	176	131	178	106	121	104; 340	16	137	18	319	126	339	189	341	70	117	30	270	298	268	226	53	315	51	112	61	334	207	200	205	163	81	128	351	130; 82	288	211	284	289	29	1	54	208	249	109	135	111	159	40	184	42	168	199	243	201	266	278	174	310	170	303	46	301	79; 329	223	325	257	231	194	11	196	347	58	190	56	272	354	346	107	53	324	116	322	165	303	163	26	154	78	150	35	239	33; 291	305	228	322	224	69	141	136	143	40	15	250	17	349	240	45	221	92	288	23	286	123	271	216	273	316	203	66	120	62; 60	247	268	167	97	73	99	18	252	83	307	104	309	326	313	195	210	236	208	321	171	225	173	97	86	162	88	262	230	260; 57	334	261	332	47	254	192	244	279	177	281	36	118	233	214	231	287	28	13	174	15	129	19	158	336	160	235	64	309	66; 5	360	3	14	318	202	155	200	64	281	77	87	144	258	317	254	12	132	10	52	248	247	207	251	311	219	125	37	123	196; 50	96	54	90	55	323	285	312	142	310	58	299	356	295	264	138	213	127	235	256	237	293	179	234	39	230	91	7	222	9];
Practice_Matrix = [1	21	6	2	6	7	22	23	3	23	17	30	17	32	24	27	24	27	5	11	28	16	15	16	29	12	4	3	4	13];

oldVerbosityLevel = Screen('Preference', 'Verbosity', 1);
oldVisualDebugLevel = Screen('Preference', 'VisualDebugLevel', 3);
screens = Screen('Screens');
screenNumber = max(screens);

[window,screen_dim] = Screen('OpenWindow', screenNumber);
    
width=screen_dim(3);
height=screen_dim(4);

Screen('TextFont', window, 'Calibri');
ShowCursor(0, window);

session=1;
ind = 1;
p1=[width/7,height/3,2*width/7,2*height/3];
p2=[3*width/7,height/3,4*width/7,2*height/3];
p3=[5*width/7,height/3,6*width/7,2*height/3];
string1 = sprintf('Session \t %d',session);  
Screen('FillRect', window, 100);
Screen(window,'FillRect',130,p1);
Screen('DrawText', window, 'Practice', p1(1)+50, p1(2)+100, [0 0 0]);
Screen(window,'FillRect',130,p2);
DrawFormattedText(window, string1,p2(1)+50,p2(2)+100,[0,0,0]);
Screen(window,'FillRect',130,p3);
Screen('DrawText', window, 'Abort', p3(1)+50, p3(2)+100, [0 0 0]);

Screen('Flip',window)

[x,y,buttons] = GetMouse(0);
while 1
while buttons(1) %if already pressed, wait for release
            [x, y, buttons] = GetMouse;
end
        while ~buttons(1) %wait for press
            [x, y, buttons] = GetMouse;
        end
        while buttons(1) %wait for release
            [x, y, buttons] = GetMouse;
 
        end
      
  if  IsInRect(x,y,p1)
%       Screen('CloseAll');
      ShowCursor; 
      practice_face_new(subject, window,screenNumber,width,height,session,pth,p1,p2,p3,ind,Practice_Matrix,Index_Matrix,h);
      Screen('Preference', 'Verbosity', oldVerbosityLevel);
      Screen('Preference', 'VisualDebugLevel', oldVisualDebugLevel);
      break;
      
      
  end
  
   if  IsInRect(x,y,p2)
%       Screen('CloseAll');
      ShowCursor; 
%       session=session+;
      face_exp_new(subject,window,screenNumber,width,height,session,pth,p1,p2,p3,ind,Index_Matrix,h);
      Screen('Preference', 'Verbosity', oldVerbosityLevel);
      Screen('Preference', 'VisualDebugLevel', oldVisualDebugLevel);
      break;
      
   end
  
  if  IsInRect(x,y,p3)
      Screen('CloseAll');
      ShowCursor;
      Screen('Preference', 'Verbosity', oldVerbosityLevel);
      Screen('Preference', 'VisualDebugLevel', oldVisualDebugLevel);
      break;
      
  end

end
end