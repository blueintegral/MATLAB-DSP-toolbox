%--- play_scale_octave.m
%---
scale.keys = [ 40 42 43 45 47 49 50 52 40 43 47 43 40];
%--- NOTES: C D E F G A B C C E G E C
% key #40 is middle-C
%
scale.durations = 0.25 * ones(1,length(scale.keys));
fs = 11025; %-- or 22050 Hz
xx = zeros(1, sum(scale.durations)*fs+length(scale.keys) );
n1 = 1;
for kk = 1:length(scale.keys)
keynum = scale.keys(kk);
tone = key2note(1, scale.keys(kk)+12, scale.durations(kk), fs) + key2note(1, scale.keys(kk), scale.durations(kk), fs)%<============= FILL IN THIS LINE
n2 = n1 + length(tone) - 1;
xx(n1:n2) = xx(n1:n2) + tone; %<=== Insert the note
n1 = n2 + 1;
end
soundsc( xx, fs)