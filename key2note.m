function xx = key2note(X, keynum, dur, fsamp) 
% KEY2NOTE Produce a sinusoidal waveform corresponding to a 
% given piano key number 
% 
% usage: xx = key2note (X, keynum, dur) 
% 
% xx = the output sinusoidal waveform 
% X = complex amplitude for the sinusoid, X = A*exp(j*phi). 
% keynum = the piano keyboard number of the desired note 
% dur = the duration (in seconds) of the output note 
% fs = sampling frequency, use 11025 or 22050 Hz 
% 

%let A-440 = key 0. Keys above it are positive, below are negative.
tt = 0:(1/fsamp):dur; 
freq = 440*2.^((keynum-49)/12);                  %<=============== fill in this line 
xx = real( X*exp(j*2*pi*freq*tt) ); 
end
