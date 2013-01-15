function xx = GenerateSound(note, articulation, duration)
%GenerateSound

%This function takes in a note (char) and a duration (in seconds) and articulation (char) which is the pronunciation (AA, EH, etc).Then it
%does the math to generate the data file ready to be put into soundsc().

%translate note to its frequency
%notes = ['C4'; 'D4'; 'E4'; 'F4'; 'Fs4'; 'G4'; 'A4'; 'B4'; 'C5'; 'D5'; 'E5'; 'F5'; 'G5'; 'A5'; 'B5'];
%fund_freqs = [261.61 293.66 329.63 349.23 369.99 392 440 493.88 523.25 587.32 659.26 698.46 783.99 880 987.77];
    
%         for j = 1:max(size(notes))
%         
%             if(strcmp(note, notes(j,1)))
%             index = j;
%             else 
%                 fprintf('did not find your note\n');
%             end
%             
%         end
%         
%         
%         note = fund_freqs(index);

        
        
fs = 8000;
tt = 0:1/12000:duration;

aa = 8*cos(2*pi*730*tt - 0.2) + 9*cos(2*pi*1090*tt - 0.2) + 3*cos(2*pi*2440*tt - 0.2);

eh = 8*cos(2*pi*530*tt - 0.2) + 9*cos(2*pi*1840*tt - 0.2) + 3*cos(2*pi*2480*tt - 0.2);

iy = 8*cos(2*pi*270*tt - 0.2) + 9*cos(2*pi*2290*tt - 0.2) + 3*cos(2*pi*3010*tt - 0.2);

ao = 8*cos(2*pi*570*tt - 0.2) + 9*cos(2*pi*840*tt - 0.2) + 3*cos(2*pi*2410*tt - 0.2);

uw = 8*cos(2*pi*300*tt - 0.2) + 9*cos(2*pi*870*tt - 0.2) + 3*cos(2*pi*2240*tt - 0.2);

%plotspec(final,8000);

tn = [0:100]/fs;

%G4offset = floor(8000/);
%E4offset = floor(8000/);




epoch = exp(-1000*tn);

elen = length(epoch);

    
AAepoch = aa(1:elen) .* epoch(1:elen);

EHepoch = eh(1:elen) .* epoch(1:elen);

IYepoch = iy(1:elen) .* epoch(1:elen);

AOepoch = ao(1:elen) .* epoch(1:elen);

UWepoch = uw(1:elen) .* epoch(1:elen);

M = round(fs/note);


if(strcmp(articulation, 'AA'))
hn = zeros(1,length(aa));
hn(1:M:length(hn)) = 1;
AAf =  conv(AAepoch,hn);
xx = AAf; 
elseif(strcmp(articulation, 'EH'))
    hn = zeros(1,length(eh));
hn(1:M:length(hn)) = 1;
EHf =  conv(EHepoch,hn);
xx = EHf;
elseif(strcmp(articulation, 'IY'))
hn = zeros(1,length(iy));
hn(1:M:length(hn)) = 1;
IYf =  conv(IYepoch,hn);
xx = IYf;
elseif(strcmp(articulation, 'AO'))
    hn = zeros(1,length(ao));
hn(1:M:length(hn)) = 1;
AOf =  conv(AOepoch,hn);
xx = AOf; 
elseif(strcmp(articulation, 'UW'))
hn = zeros(1,length(uw));
hn(1:M:length(hn)) = 1;
UWf =  conv(UWepoch,hn);
xx = UWf;
end