function [] = scale()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
w=[];
notes=[4 16 28 40 52 64 76 88 100];
freq=[27.5 55 110 220 440 880 1760 3520 7040];
for i=[0 2 4 5 7 9 11]
    for j=1:9
w=[w; key2note(gaussian1(440,2,(notes(j)+i)),notes(j)+i,.5,22050)];
    end

end
    z=zeros(1,(.125*22050));
    c=sum(w(1:9,:));
    d=sum(w(10:18,:));
    e=sum(w(19:27,:));
    f=sum(w(28:36,:));
    g=sum(w(37:45,:));
    a=sum(w(46:54,:));
    b=sum(w(55:63,:));
    sound=[];
    for i=1:5
    sound= [sound c z d z e z f z g z a z b z];
    end
     spectrogram(sound,700,276,512,22050,'yaxis')
    soundsc(sound,22050);
  
    

end

