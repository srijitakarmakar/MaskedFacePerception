function practice_face_new (subject, window, screenNumber,width, height, session, pth, p1, p2, p3, ind, Practice_Matrix, Index_Matrix,h)
% check for Opengl compatibility, abort otherwise:
AssertOpenGL;
KbName('UnifyKeyNames');
KbCheck;
%escape = KbName('ESCAPE');

responseKey   = 1; % X mouse button


% load data
pfolder = dir ('C:/Users/Dr. Koel Das/Documents/MATLAB/Srijita/Stim_test_SK/New Paradigm/Practice Session Images/*.jpg');
pfolder = natsortfiles(pfolder); 
[r,t]=size(Practice_Matrix); % r = no. of blocks, t = no. of trials
rating = zeros(t,4);

% for fixation cross
x1 = (width/2)-10;
y1 = (height/2);
x2 = (width/2)+10;
y2 = (height/2);
xy1 = [x1 x2; y1 y2];
x3 = (width/2);
y3 = (height/2)-10;
x4 = (width/2);
y4 = (height/2)+10;
xy2 = [x3 x4; y3 y4];

try 

%rating = zeros(num, 3); % to store RT and confidence rating per subject per block: col1 = stim_list, col2: confidence ratin, col3: RT
FixCr=zeros(500,2);
fixcross = Screen('MakeTexture', window, FixCr);

FixCr2=ones(40,40)*240;
FixCr2(20:21,:)=0;
FixCr2(:,20:21)=0;  %try imshow(FixCr2) to display the result in Matlab
fixcross2 = Screen('MakeTexture', window, FixCr2);

ShowCursor(0,window);

introText = 'Please read carefully: \n\n 1. You will be shown 30 images of faces you may or may not know.\n\n \n\n 2. Your task is to respond with a left mouse click (click only once, as soon as possible), \n\n in a 2-back manner, for images of the SAME INDIVIDUAL \n\n \n\n 3. Click on the LEFT mouse button AFTER you see the SECOND repeated image\n\n \n\n 4. Click to respond only when the "Response" text appears\n\n \n\n Click mouse button to continue ...';
Screen('FillRect', window, 240);
DrawFormattedText(window, introText, 'center', 'center', 0);
% IOPort('Write',h,'t');WaitSecs(0.01);% IOPort('Write',h,'t'); 
Screen('Flip', window);
IOPort('Write',h,'b'); % T1

    while (1) %wait for user response
        [x,y,buttons] = GetMouse(screenNumber);
        if buttons(1) || KbCheck
          break;
        end
    end
  

Jitter = [0.900000000000000,0.800000000000000,0.800000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.900000000000000,0.800000000000000,1,1,0.800000000000000,1,0.800000000000000,0.900000000000000,0.900000000000000,1,1,0.800000000000000,0.800000000000000,0.900000000000000,0.800000000000000,1,1,1,1,0.800000000000000,1,0.900000000000000,0.800000000000000,0.900000000000000];
%len = numel(pfolder);
%list = randperm(len,12);
% start trials

for n = 1:t
%HideCursor;
%start_time_trial GetSecs;
indx = Practice_Matrix(n);
if n>2
    indx_copy = Practice_Matrix(n-2);
end
Image = imread([pfolder(indx).name]);
%theImage = imresize(I, 1.5); % resizing

%% fixation cross (Jitter1)
%t_in = randi([1,4],1);

t_fc = Jitter(n);
Screen('FillRect', window, [240, 240, 240]);
%Screen('DrawTexture', window, fixcross2);
Screen('DrawLines', window, xy1, 1, 0);
Screen('DrawLines', window, xy2, 1, 0);
Screen('Flip', window);
IOPort('Write',h,'b'); % T2
WaitSecs(t_fc);

%% Present stimuli 

Screen('FillRect', window, [240 240 240])

% Make the image into a texture
imageTexture = Screen('MakeTexture', window, Image);


% Draw the image to the screen
Screen('DrawTexture', window, imageTexture, [], [], 0);

% fixation cross
%Screen('DrawTexture', window, fixcross2);
Screen('DrawLines', window, xy1, 1, 0);
Screen('DrawLines', window, xy2, 1, 0);

% Flip to the screen
Screen('Flip', window);
IOPort('Write',h,'b'); % T3

start_time = GetSecs;
% Wait for 100 ms
WaitSecs(0.1);

% restime(n) = start_time - GetSecs; 

%% pre-response screen

Screen('FillRect', window, [240 240 240])
% fixation cross
Screen('DrawLines', window, xy1, 1, 0);
Screen('DrawLines', window, xy2, 1, 0);
%Screen('DrawTexture', window, fixcross2);
% Flip to the screen
Screen('Flip', window);
IOPort('Write',h,'b'); % T4

% Wait for 350 ms
WaitSecs(0.35);

%% inter-stimulus-interval / Response Scren (1000 ms)
responseText = 'Response';
Screen('FillRect', window, [240 240 240]);
if n>2
DrawFormattedText(window, responseText, 'center', (height/2)-70, 0);
end
Screen('DrawLines', window, xy1, 1, 0);
Screen('DrawLines', window, xy2, 1, 0);
% Flip to the screen
Screen('Flip', window);
IOPort('Write',h,'b'); % T5

t0 = GetSecs;
answer = 0;
while answer == 0
    %WaitSecs(1);
    [x,y,buttons,focus,valuators,valinfo] = GetMouse(screenNumber);
    secs = GetSecs;
    %WaitSecs(1);
        if buttons(responseKey) == 1
            answer = 1;
        end
    if secs - t0 > 1 
        break
    end
end           
restime(n) = secs - start_time; 
result(n) = answer;
%WaitSecs(1);

%% saving stimuli-wise performance
if n==1 && answer == 1 % Go on non-task trial
points(n)=0;
elseif n==2 && answer == 1 % Go on non-task trial
points(n)=0;
elseif n>2 && indx == (indx_copy+2) && answer==1  % Go on task-trials
points(n)=1;
elseif n>2 && indx == (indx_copy+4) && answer==1  % Go on task-trials
points(n)=1;
elseif n>2 && indx == (indx_copy-2) && answer==1  % Go on task-trials
points(n)=1;
elseif n>2 && indx == (indx_copy-4) && answer==1  % Go on task-trials
points(n)=1;
elseif n==1 && answer == 0 % No-go on non-task trial
points(n)=1;
elseif n==2 && answer == 0 % No-go on non-task trial
points(n)=1;
elseif n>2 && indx == (indx_copy+2) && answer==0  % No-go on task-trials
points(n)=0;
elseif n>2 && indx == (indx_copy+4) && answer==0  
points(n)=0;
elseif n>2 && indx == (indx_copy-2) && answer==0  
points(n)=0;
elseif n>2 && indx == (indx_copy-4) && answer==0  
points(n)=0;
elseif n>2 && indx ~= (indx_copy+2) && answer==0  % No-go on non task-trials
points(n)=1;
elseif n>2 && indx ~= (indx_copy+4) && answer==0  
points(n)=1;
elseif n>2 && indx ~= (indx_copy-2) && answer==0  
points(n)=1;
elseif n>2 && indx ~= (indx_copy-4) && answer==0  
points(n)=1;
elseif n>2 && indx ~= (indx_copy+2) && answer==1  % Go on non-task task-trials
points(n)=0;
elseif n>2 && indx ~= (indx_copy+4) && answer==1  
points(n)=0;
elseif n>2 && indx ~= (indx_copy-2) && answer==1  
points(n)=0;
elseif n>2 && indx ~= (indx_copy-4) && answer==1  
points(n)=0;

% elseif n>2 && indx~=indx_copy && answer==0 % No-go on non-task trials
% points(n)=1;
% elseif n>2 && indx ~= indx_copy && answer==1 % Go on non-task trials
% points(n)=0;
% elseif n>2 && indx == indx_copy && answer==0 % No-go on task trials
% points(n)=0;
end
end
rating(:,1)=(1:30)';
rating(:,2)=result;
rating(:,3)=restime;
rating(:,4)=points;
%filename = strcat('Log', {' '}, subject, {'_'}, num2str(session), '.mat');
%filename = sprintf('Log_%s_block_%d.mat', subject, session);
%save([pth filename], 'rating');


string1 = sprintf('Session \t %d',session); 
Screen('FillRect', window, 100);
Screen(window,'FillRect',130,p1);
Screen('DrawText', window, 'Practice', p1(1)+50, p1(2)+100, [0 0 0]);
Screen(window,'FillRect',130,p2);
DrawFormattedText(window, string1,p2(1)+50,p2(2)+100,[0,0,0]);
Screen(window,'FillRect',130,p3);
Screen('DrawText', window, 'Abort', p3(1)+50, p3(2)+100, [0 0 0]);
Screen('Flip',window)


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
%       h = IOPort('OpenSerialPort', 'com3','BaudRate=19200');
%       IOPort('Write',h,'a');
      practice_face_new(subject,window,screenNumber,width,height,session,pth,p1,p2,p3,ind,Practice_Matrix,Index_Matrix,h);
%       Screen('Preference', 'Verbosity', oldVerbosityLevel);
%       Screen('Preference', 'VisualDebugLevel', oldVisualDebugLevel);
      break;
      
      
  end
  
   if  IsInRect(x,y,p2)
%       Screen('CloseAll');
      ShowCursor; 
      %h = IOPort('OpenSerialPort', 'com3','BaudRate=19200');
      %IOPort('Write',h,'a');
%       session=session+1;
      face_exp_new(subject,window,screenNumber,width,height,session,pth,p1,p2,p3,ind,Index_Matrix,h);
%       Screen('Preference', 'Verbosity', oldVerbosityLevel);
%       Screen('Preference', 'VisualDebugLevel', oldVisualDebugLevel);
      break;
      
   end
  
  if  IsInRect(x,y,p3)
      Screen('CloseAll');
      ShowCursor;
%       Screen('Preference', 'Verbosity', oldVerbosityLevel);
%       Screen('Preference', 'VisualDebugLevel', oldVisualDebugLevel);
      break;
      
  end

end

catch
	Screen('CloseAll');
	ShowCursor;
%     Screen('Preference', 'Verbosity', oldVerbosityLevel);
%     Screen('Preference', 'VisualDebugLevel', oldVisualDebugLevel);
	psychrethrow(psychlasterror);
end
end