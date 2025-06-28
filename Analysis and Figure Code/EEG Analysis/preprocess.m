% to verify if triggers are detected and filter and epoch raw data
% subject-wise analysis
% subject = 'annesh'; % 10th block for Annesh has missed a trigger

function preprocess (subject)

for w = 1:15 % w = blocks
    close all;
    clear trigger_data;
    clear filtered_data;
    clear image_data1;
    
    if w<10
        filename = strcat(subject,'0',num2str(w), '.txt');
    else
        filename = strcat(subject,num2str(w), '.txt');
    end
    

A = load(filename);
trig = A(:,33);
T = find(trig == 6);
trigger = trig(1:end-1)-trig(2:end);
T = find(trigger == 4);
T_copy (w)= T(1);

if w == 10 && strcmp(subject,'sub31')==1 
    T = T;
else
    T(1)=[]; % every second out of 4 triggers is the stimuli onset trigger
end
l = length(T);

cutoff_high=40; cutoff_low=0.1;

if isempty(find(A(:,33)==6))
        trigger=66;
else
        trigger=33;
end

% filtering

sampling_rate=512;
filter_order=3;
k=1;

data=A(2:end,[1:32 34:65]);
trigger_data=A(2:end,trigger);
    
[x, y] = butter(filter_order, [cutoff_low/(sampling_rate/2),cutoff_high/(sampling_rate/2)],'bandpass'); 
filtered_data = filtfilt(x,y,data);

% epoching: to generate 3-D matrix "image_data_1" (time X channels (64) X trials (30))

T = reshape(T,4,30);
    
    for j=1:30
        image_data1=filtered_data(T(2,j)-102:T(2,j)+205,:);
        image_data(:,:,k)=image_data1;
        k=k+1;
    end
    
[r,c] = size(image_data(:,:,2));
x = [1:r]/512;
%plot(x*1000, image_data1)
%axis([0 600 -300 300])
%xline(200);

x=image_data(:,setdiff(1:64,[1 3 11 33 36]),:);
    
	
%==========Pre Processing the data  ========================= 
%-----Sequence of pre-processing-----------
%-----Zscore -> Average Referencing -> Base line Correcting

%h=zscore(x); % zscoring
[a,b,c]=size(x);
h=x;
mean1=mean(h,2);
x1=x-repmat(mean1,1,b);%average referencing
for i=1:c
     mean2 = mean(h(1:100,:,i),1);
     x2(:,:,i)=h(:,:,i)-repmat(mean2,a,1); % baseline correction
end

    image1=x2;
    image1 = permute(image1,[2 1 3]);
    file_write = strcat(subject, num2str(w), '_epoch.mat');
    save(file_write,'image1');
    %x = [1:r]/512;
    %plot(x*1000, image1(:,:,30))
    %xline(200);
    %save(file5,'image1','response');

end     

% stacking epochs of each trial for a subject (c: 308 X 59 X 450)
c = zeros(59,308,30);
for i = 1:15
    f1 = strcat(subject, num2str(i),'_epoch.mat');
    A = load(f1);
    a = A.image1;
    c = cat(3,a,c);
end
c(:,:,451:480) = [];
f2 = strcat(subject, '_all_trials_epoch.mat');
%c = permute(c,[2 1 3]);
save(f2, 'c');


% segregate epochs into 6 categories

file = strcat(subject,'_all_trials_epoch.mat');
A = load(file);
Data = A.c;

f3 = strcat(subject, '_unmasked_famous_trials.mat');
f4 = strcat(subject, '_masked_famous_trials.mat');
f5 = strcat(subject, '_unmasked_familiar_trials.mat');
f6 = strcat(subject, '_masked_familiar_trials.mat');
f7 = strcat(subject, '_unmasked_unfamiliar_trials.mat');
f8 = strcat(subject, '_masked_unfamiliar_trials.mat');

f9 = strcat(subject, '_unmasked_famous_eeg');
f10 = strcat(subject, '_masked_famous_eeg');
f11 = strcat(subject, '_unmasked_familiar_eeg');
f12 = strcat(subject, '_masked_familiar_eeg');
f13 = strcat(subject, '_unmasked_unfamiliar_eeg');
f14 = strcat(subject, '_masked_unfamiliar_eeg');


%================ over unmasked famous trials (UM_F)===============
T1 = load(f3);
UM_F = T1.UM_F_trials;
UM_F = UM_F(:,1)';
%UM_F = [1	10	13	15	16	37	39	40	46	48	62	72	73	74	90	91	97	100	102	113	121	127	129	130	142	151	157	159	172	174	184	200	202	208	210	212	214	220	222	230	241	248	255	257	268	280	282	289	294	296	310	318	328	329	330	331	338	342	355	357	372	373	378	388	390	394	399	407	409	410	421	422	423	424	431];

data_UM_F = Data(:,:,UM_F);
save (f9, 'data_UM_F');

% ============ over masked famous trials (M_F)============

T2 = load(f4);
M_F = T2.M_F_trials;
M_F = M_F(:,1);

%M_F = [7	21	22	23	24	33	51	53	55	56	66	70	79	84	86	101	104	116	118	120	128	133	135	136	146	163	165	167	176	178	182	188	190	193	197	221	227	229	231	237	246	247	251	253	270	277	286	287	298	300	306	311	313	316	320	335	336	337	340	354	361	365	379	381	383	391	393	401	402	418	425	445	447	448	450];

data_M_F = Data(:,:,M_F);
save (f10, 'data_M_F');

% ============== over unmasked familiar trials (UM_Fa)=================
T3 = load(f5);
UM_Fa = T3.UM_Fa_trials;
UM_Fa = UM_Fa(:,1); 

%UM_Fa = [18	20	26	28	30	34	36	38	43	60	61	63	64	78	87	92	94	103	110	119	122	124	126	140	149	152	153	154	162	180	181	191	198	205	207	216	226	234	238	240	249	256	258	264	266	276	278	281	295	297	303	305	308	315	324	347	348	349	356	359	367	375	380	384	386	396	398	403	408	420	429	436	444	446	449];

data_UM_Fa = Data(:,:,UM_Fa);
save (f11, 'data_UM_Fa');

% ============= over masked familiar trials (M_Fa)===================

T4 = load(f6);
M_Fa = T4.M_Fa_trials;
M_Fa = M_Fa(:,1);
%M_Fa = [2	3	4	5	12	35	42	44	54	58	68	75	80	82	88	95	96	98	114	117	123	132	143	145	147	155	166	169	171	173	183	185	187	206	209	213	218	233	235	236	243	252	254	259	261	272	275	291	293	299	307	309	317	322	327	334	346	351	352	353	370	374	376	382	387	397	413	416	417	419	437	438	439	441	443];

data_M_Fa = Data(:,:,M_Fa);
save (f12, 'data_M_Fa');

% ========== over unmasked unfamiliar trials (UM_UF) ===========

T5 = load(f7);
UM_UF = T5.UM_UF_trials;
UM_UF = UM_UF(:,1);
%UM_UF = [6	8	9	11	29	31	50	52	57	59	69	71	83	85	89	93	99	109	111	115	125	134	144	148	150	156	158	160	168	175	186	192	201	203	204	211	223	224	225	232	242	244	262	263	265	283	284	285	288	290	304	312	319	321	326	333	339	344	358	360	362	364	366	368	385	392	395	404	406	411	428	430	433	435	440];

data_UM_UF = Data(:,:,UM_UF);

save (f13, 'data_UM_UF');

% =============== over masked unfamiliar trials (M_UF) ================
T6 = load(f8);
M_UF = T6.M_UF_trials;
M_UF = M_UF(:,1);

%M_UF = [14	17	19	25	27	32	41	45	47	49	65	67	76	77	81	105	106	107	108	112	131	137	138	139	141	161	164	170	177	179	189	194	195	196	199	215	217	219	228	239	245	250	260	267	269	271	273	274	279	292	301	302	314	323	325	332	341	343	345	350	363	369	371	377	389	400	405	412	414	415	426	427	432	434	442];

data_M_UF = Data(:,:,M_UF);
save (f14, 'data_M_UF');
       
end
