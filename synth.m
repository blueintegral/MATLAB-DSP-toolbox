%Synthesizes some phonetic sounds

% F1 = 730;
% F2 = 1090;
% F3 = 2390;
close all;
clear
clc

tt = 0:1/8000:2;
fs = 8000;
part1 = 0;
part2 = 0;
% test = 8*cos(2*pi*F1*tt-.23)+9*cos(2*pi*F2*tt ...
%     +.15)+3*cos(2*pi*F3*tt+.27);

AA = 8*cos(2*pi*730*tt-.23)+9*cos(2*pi*1090*tt ...
    +.15)+3*cos(2*pi*2440*tt+.27);

EH = 8*cos(2*pi*530*tt-.23)+9*cos(2*pi*1840*tt ...
    +.15)+3*cos(2*pi*2480*tt+.27);

IY = 8*cos(2*pi*270*tt-.23)+9*cos(2*pi*2290*tt ...
    +.15)+3*cos(2*pi*3010*tt+.27);

AO = 8*cos(2*pi*570*tt-.23)+9*cos(2*pi*840*tt ...
    +.15)+3*cos(2*pi*2410*tt+.27);

UW = 8*cos(2*pi*300*tt-.23)+9*cos(2*pi*870*tt ...
    +.15)+3*cos(2*pi*2240*tt+.27);

if(part1)
plotspec(AA,8000)
figure
plotspec(EH, 8000)
figure 
plotspec(IY, 8000)
figure
plotspec(AO, 8000)
figure 
plotspec(UW, 8000)
end


tt2 = 0:.00011250:90/8000;
epoch = exp(-1000.*tt2);


epoch_length = length(epoch);

AAepoch = AA(1:epoch_length).*epoch(1:length(epoch));
EHepoch = EH(1:epoch_length).*epoch(1:length(epoch));
IYepoch = IY(1:epoch_length).*epoch(1:length(epoch));
AOepoch = AO(1:epoch_length).*epoch(1:length(epoch));
UWepoch = UW(1:epoch_length).*epoch(1:length(epoch));

if(part2)
figure
plot(tt2, epoch); %plot raw epoch function
figure
plot(tt2, AAepoch);
figure
plot(tt2, EHepoch);
figure
plot(tt2, IYepoch);
figure
plot(tt2, AOepoch);
figure
plot(tt2, UWepoch);
end


%play continuous sound

%change AAepoch to whatever you vowel you want
duration = 2; %duration of speech in seconds
counter = 0;
AAresult = [];
for i = 1:((fs*duration)/50)
    if(i == 1)
        AAresult = [AAresult AAepoch(1:50)];
        %counter = 0;
    elseif(i == fs*duration/50 - 1)
        AAresult = [AAresult AAepoch(51:100)];
    else
        %counter = counter + 50;
        AAresult = [AAresult AAepoch(1:50)+AAepoch(51:100)];
    end       
end
  
soundsc(AAresult, fs);
plotspec(AAresult, fs);



duration = 2; %duration of speech in seconds
counter = 0;
EHresult = [];
for i = 1:((fs*duration)/50)
    if(i == 1)
        EHresult = [EHresult EHepoch(1:50)];
        %counter = 0;
    elseif(i == fs*duration/50 - 1)
        EHresult = [EHresult EHepoch(51:100)];
    else
        %counter = counter + 50;
        EHresult = [EHresult EHepoch(1:50)+EHepoch(51:100)];
    end       
end
  
soundsc(EHresult, fs);
figure;
plotspec(EHresult, fs);



duration = 2; %duration of speech in seconds
counter = 0;
IYresult = [];
for i = 1:((fs*duration)/50)
    if(i == 1)
        IYresult = [IYresult IYepoch(1:50)];
        %counter = 0;
    elseif(i == fs*duration/50 - 1)
        IYresult = [IYresult IYepoch(51:100)];
    else
        %counter = counter + 50;
        IYresult = [IYresult IYepoch(1:50)+IYepoch(51:100)];
    end       
end
  
soundsc(IYresult, fs);
figure;
plotspec(IYresult, fs);



duration = 2; %duration of speech in seconds
counter = 0;
AOresult = [];
for i = 1:((fs*duration)/50)
    if(i == 1)
        AOresult = [AOresult AOepoch(1:50)];
        %counter = 0;
    elseif(i == fs*duration/50 - 1)
        AOresult = [AOresult AOepoch(51:100)];
    else
        %counter = counter + 50;
        AOresult = [AOresult AOepoch(1:50)+AOepoch(51:100)];
    end       
end
  
soundsc(AOresult, fs);
figure;
plotspec(AOresult, fs);



duration = 2; %duration of speech in seconds
counter = 0;
UWresult = [];
for i = 1:((fs*duration)/50)
    if(i == 1)
        UWresult = [UWresult UWepoch(1:50)];
        %counter = 0;
    elseif(i == fs*duration/50 - 1)
        UWresult = [UWresult UWepoch(51:100)];
    else
        %counter = counter + 50;
        UWresult = [UWresult UWepoch(1:50)+UWepoch(51:100)];
    end       
end
  
soundsc(UWresult, fs);
figure;
plotspec(UWresult, fs);


