nsub = 25;
for k = 1:nsub

    if k == 1
        subject = 'sub23';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	1	0	0	1	0	1	1	0	0	0	0	0	0	0	1	0	0	0];
    elseif k == 2
        subject = 'sub22';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	0	1	1	0	0	0	0	0	0	0	1	0	1	0];
    elseif k == 3
        subject = 'sub26';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	1	0	0	0	0	0	0	0	0	1	0	0	0];
    elseif k == 4
        subject = 'sub20';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	1	0	1	0	0	1	0	1	1];
    elseif k == 5
        subject = 'sub19';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	0	1	1	1	1	1	1	0];
    elseif k == 6
        subject = 'sub21';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	0	0	0	1	0	0	1	0	1	0];
    elseif k == 7
        subject = 'sub24';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1];
    elseif k == 8
        subject = 'sub25';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	0	0	0	0	0	0	0	1	1	0	1];
    elseif k == 9
        subject = 'sub27';
        familiarity_rating = [1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	0	0	1	1	0	0	1	0	1	1	0	1	1	0	0	0	0	0	0	0	1	0	0	0];
    elseif k == 10
        subject = 'sub28';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	1	1	1	1	1	1	1	1];
    elseif k == 11
        subject = 'sub29';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	0	0	0	0	0	0	1	1	1	0	1];
    elseif k == 12
        subject = 'sub31';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	0	0	0	0	0	1	1	1	1	1	1];
    elseif k == 13
        subject = 'sub30';
        familiarity_rating = [1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	0	0	0	1	1	0	1	1	1	1];
    elseif k == 14
        subject = 'sub32';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	0	1	1	1	1	1	1	1	0	0	1	0	1	1	1	1];
    elseif k == 15
        subject = 'sub33';
        familiarity_rating = [1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	0	0	1	1	0	1	1	1	1	1	1	1	1	1	1	0	1	1	1	0	1	0	1	1];
    elseif k == 16
        subject = 'sub34';
        familiarity_rating = [0	1	1	1	0	0	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	0	1	1	0	0	1	1];
    elseif k == 17
        subject = 'sub35';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	1	1	1	1	1	1	1	1];
    elseif k == 18
        subject = 'sub36';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	0	1	1];
    elseif k == 19
        subject = 'sub37';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1];
    elseif k == 20
        subject = 'sub38';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	0	1	1	1	1	1	1	1];
    elseif k == 21
        subject = 'sub39';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	1];
    elseif k == 22
        subject = 'sub40';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1];
    elseif k == 23
        subject = 'sub41';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	1	1	1	0	1	0	1	0	1	0];
    elseif k == 24
        subject = 'sub42';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1];
    elseif k == 25
        subject = 'sub43';
        familiarity_rating = [1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1];
    end

    trials_post_rating(subject, familiarity_rating);
    preprocess(subject);
    eeglab_only_rejection(subject);

end