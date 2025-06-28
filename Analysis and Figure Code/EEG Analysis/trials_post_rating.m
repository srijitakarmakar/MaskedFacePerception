function trials_post_rating (subject, familiarity_rating)

UM_F = [1	10	13	15	16	37	39	40	46	48	62	72	73	74	90	91	97	100	102	113	121	127	129	130	142	151	157	159	172	174	184	200	202	208	210	212	214	220	222	230	241	248	255	257	268	280	282	289	294	296	310	318	328	329	330	331	338	342	355	357	372	373	378	388	390	394	399	407	409	410	421	422	423	424	431];
%UM_F_male = [1 10 37 39 40 62 72 74 97 113 127 129 142 157 172 174 184 202 212 214 230 241 268 289 296 318 329 338 355 357 372 373 394 407 409 422 424];
%UM_F_female = setdiff(UM_F, UM_F_male, 'stable');

M_F = [7	21	22	23	24	33	51	53	55	56	66	70	79	84	86	101	104	116	118	120	128	133	135	136	146	163	165	167	176	178	182	188	190	193	197	221	227	229	231	237	246	247	251	253	270	277	286	287	298	300	306	311	313	316	320	335	336	337	340	354	361	365	379	381	383	391	393	401	402	418	425	445	447	448	450];
%M_F_male = [7 22 24 33 56 66 79 116 118 120 128 146 176 178 182 188 190 221 237 251 253 270 277 298 300 311 313 316 336 340 365 379 381 401 402 447 448 450];
%M_F_female = setdiff(M_F, M_F_male, 'stable');

UM_Fa = [18	20	26	28	30	34	36	38	43	60	61	63	64	78	87	92	94	103	110	119	122	124	126	140	149	152	153	154	162	180	181	191	198	205	207	216	226	234	238	240	249	256	258	264	266	276	278	281	295	297	303	305	308	315	324	347	348	349	356	359	367	375	380	384	386	396	398	403	408	420	429	436	444	446	449];
M_Fa = [2	3	4	5	12	35	42	44	54	58	68	75	80	82	88	95	96	98	114	117	123	132	143	145	147	155	166	169	171	173	183	185	187	206	209	213	218	233	235	236	243	252	254	259	261	272	275	291	293	299	307	309	317	322	327	334	346	351	352	353	370	374	376	382	387	397	413	416	417	419	437	438	439	441	443];
UM_UF = [6	8	9	11	29	31	50	52	57	59	69	71	83	85	89	93	99	109	111	115	125	134	144	148	150	156	158	160	168	175	186	192	201	203	204	211	223	224	225	232	242	244	262	263	265	283	284	285	288	290	304	312	319	321	326	333	339	344	358	360	362	364	366	368	385	392	395	404	406	411	428	430	433	435	440];
M_UF = [14	17	19	25	27	32	41	45	47	49	65	67	76	77	81	105	106	107	108	112	131	137	138	139	141	161	164	170	177	179	189	194	195	196	199	215	217	219	228	239	245	250	260	267	269	271	273	274	279	292	301	302	314	323	325	332	341	343	345	350	363	369	371	377	389	400	405	412	414	415	426	427	432	434	442];

Image_Index = [32	133	191	135	175	314	17	318	246	76	342	173	72	337	68	38	325	204	327	146	105	31	59	35	263	212	277	214	350	164; 294	359	31	176	187	180	48	134	44	114	331	153	238	151	273	68	265	98	267	282	21	304	23	229	67	43	340	121	338	198; 160	80	162	180	241	93	243	143	308	25	310	94	4	96	209	297	353	122	85	227	345	223	302	3	280	5	178	149	284	108; 6	144	330	140	151	181	88	185	358	100	63	102	124	71	269	335	255	333	300	188	296	339	44	197	260	95	145	119	220	115; 22	148	193	152	290	154	74	111	76	20	327	169	65	276	61	49	259	245	263	224	355	8	183	296	185	33	161	348	206	344; 2	166	182	164	139	344	110	292	24	294	283	172	41	295	27	157	25	320	217	357	219	84	199	80	274	89	253	115	255	232; 186	113	147	12	149	242	215	75	343	77	218	306	101	275	267	271	103	156	333	102	352	34	354	328	176	131	178	106	121	104; 340	16	137	18	319	126	339	189	341	70	117	30	270	298	268	226	53	315	51	112	61	334	207	200	205	163	81	128	351	130; 82	288	211	284	289	29	1	54	208	249	109	135	111	159	40	184	42	168	199	243	201	266	278	174	310	170	303	46	301	79; 329	223	325	257	231	194	11	196	347	58	190	56	272	354	346	107	53	324	116	322	165	303	163	26	154	78	150	35	239	33; 291	305	228	322	224	69	141	136	143	40	15	250	17	349	240	45	221	92	288	23	286	123	271	216	273	316	203	66	120	62; 60	247	268	167	97	73	99	18	252	83	307	104	309	326	313	195	210	236	208	321	171	225	173	97	86	162	88	262	230	260; 57	334	261	332	47	254	192	244	279	177	281	36	118	233	214	231	287	28	13	174	15	129	19	158	336	160	235	64	309	66; 5	360	3	14	318	202	155	200	64	281	77	87	144	258	317	254	12	132	10	52	248	247	207	251	311	219	125	37	123	196; 50	96	54	90	55	323	285	312	142	310	58	299	356	295	264	138	213	127	235	256	237	293	179	234	39	230	91	7	222	9];
Image_Index = reshape(Image_Index',1,450);
Trial_Index = [1:450];
Trial_Matrix = cat(1,Trial_Index, Image_Index);
Trial_Matrix = Trial_Matrix';

UM_F_Im = Trial_Matrix(UM_F,2); % image indices of unmasked famous trials
% UM_F_male_Im = Trial_Matrix(UM_F_male,2);
% UM_F_female_Im = Trial_Matrix(UM_F_female,2);
M_F_Im = Trial_Matrix(M_F,2); % image indices of masked famous trials
% M_F_male_Im = Trial_Matrix(M_F_male,2);
% M_F_female_Im = Trial_Matrix(M_F_female,2);
UM_Fa_Im = Trial_Matrix(UM_Fa,2); % image indices of unmasked familiar trials
M_Fa_Im = Trial_Matrix(M_Fa,2); % image indices of masked familiar trials
UM_UF_Im = Trial_Matrix(UM_UF,2); % image indices of unmasked unfamiliar trials
M_UF_Im = Trial_Matrix(M_UF,2); % image indices of masked unfamiliar trials

UM_F_trials = cat(2,UM_F', UM_F_Im); % unmasked famous trials
M_F_trials = cat(2,M_F', M_F_Im);  % masked famous trials
UM_Fa_trials = cat(2,UM_Fa', UM_Fa_Im);  % unmasked familiar trials
M_Fa_trials = cat(2,M_Fa', M_Fa_Im);  % masked familiar trials
UM_UF_trials = cat(2,UM_UF', UM_UF_Im);  % unmasked unfamiliar trials
M_UF_trials = cat(2,M_UF', M_UF_Im);  % masked unfamiliar trials

% ================ subject info ==================
%subject = 'kalyan';
f1 = strcat(subject, '_unmasked_famous_trials');
f2 = strcat(subject, '_masked_famous_trials');
f3 = strcat(subject, '_unmasked_familiar_trials');
f4 = strcat(subject, '_masked_familiar_trials');
f5 = strcat(subject, '_unmasked_unfamiliar_trials');
f6 = strcat(subject, '_masked_unfamiliar_trials');

% pre outlier removal
%familiarity_rating = [1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	0	0	0	1	1	0	1	1	1	1];
A = find(familiarity_rating == 0);
B = A*6 - 5;
C = A*6;

for i = 1:length(A)
    I = [B(i):C(i)];
    for j = 1:6
        if A(i)<21 % ==== famous trials =====
            to_remove = UM_F_trials(:,2)==I(j);
            %UM_UF_trials = cat(1, UM_UF_trials, UM_F_trials(to_remove,:));
            UM_F_trials(to_remove,:)=[];
            to_remove = M_F_trials(:,2)==I(j);
            %M_UF_trials = cat(1, M_UF_trials, M_F_trials(to_remove,:));
            M_F_trials(to_remove,:)=[];
        else % ==== familiar trials =====
            to_remove = UM_Fa_trials(:,2)==I(j);
            %UM_UF_trials = cat(1, UM_UF_trials, UM_Fa_trials(to_remove,:));
            UM_Fa_trials(to_remove,:)=[];
            to_remove = M_Fa_trials(:,2)==I(j);
            %M_UF_trials = cat(1, M_UF_trials, M_Fa_trials(to_remove,:));
            M_Fa_trials(to_remove,:)=[];
        end
    end
end

save(f1, 'UM_F_trials');
save(f2, 'M_F_trials');
save(f3, 'UM_Fa_trials');
save(f4, 'M_Fa_trials');
save(f5, 'UM_UF_trials');
save(f6, 'M_UF_trials');
end