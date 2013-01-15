clear
clc
fsamp = 8000; %sampling freq
dur = 2.5; %duration (s)
%dur = 0:(1/fsamp):long;
ff = 55:1760; % frequency range
fc = 440; %center frequency
sigma = 1; %sigma, or half-width (1 = 1 octave)

note1amp = exp(-(log2(261.626)-log2(fc)).^2/(2.*(sigma^2)));
note2amp = exp(-(log2(523.251)-log2(fc)).^2/(2.*(sigma^2)));
note3amp = exp(-(log2(1046.50)-log2(fc)).^2/(2.*(sigma^2)));
note4amp = exp(-(log2(130.813)-log2(fc)).^2/(2.*(sigma^2)));
note5amp = exp(-(log2(65.4064)-log2(fc)).^2/(2.*(sigma^2)));

note1 = key2note(note1amp,40,dur,fsamp);
note2 = key2note(note2amp,52,dur,fsamp);
note3 = key2note(note3amp,64,dur,fsamp);
note4 = key2note(note4amp,28,dur,fsamp);
note5 = key2note(note5amp,16,dur,fsamp);

note = note1+note2+note3+note4+note5
soundsc(note, fsamp)

spectrogram(note, 512,384,512,fsamp,'yaxis')


%ww = exp(-(log2(ff)-log2(fc)).^2/(2.*(sigma^2)));
