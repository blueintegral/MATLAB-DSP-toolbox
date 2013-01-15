function dkeys = DTMFkeys(TT, omegahats, nskip, fs ) 

%DTMFKEYS returns list of keys based on the estimated frequencies % 
% usage: dkeys = DTMFkeys( TT, omegahats, nskip, fs ) 
% 
% TT = structure containing freqs and key names 
% omegahats = P by 2 matrix of estimated frequencies 
% nskip = value used in DTMFfreqs.m 
% fs = sampling frequency 
% dkeys = detected keys 


position = 0;
chunkSize = nskip * 5;

rowChunkAvg = 0;
colChunkAvg = 0;

rowFreqList = [];
colFreqList = [];

rowFreqAvg = [];
colFreqAvg = [];

bb = 1;
cc = 1;


% for each chunk

for nn = 1:chunkSize:(max(size(omegahats)) - chunkSize + 1)

 %This gets a chunk from both row and column of omegahat matrix  
 rowFiltChunk = omegahats(nn: nn+chunkSize - 1,1);
 colFiltChunk = omegahats(nn: nn+chunkSize - 1,2);
    
%if the chunk is nonzero & you are looking for a new dual tone
if((~any(rowFiltChunk == 0)) || (~any(colFiltChunk == 0)) && position == 0)
    
     %calculate the average frequency within the chunk 
     rowChunkAvg = sum(rowFiltChunk)/chunkSize;
     colChunkAvg = sum(colFiltChunk)/chunkSize;
     %add the average to frequency list
     rowFreqList(bb) = rowChunkAvg;
     colFreqList(bb) = colChunkAvg;
     %change position to 1 meaning we're no more at the beginning
     position = 1;
     %increment index of frequency list
     bb = bb + 1;

%elseif chunk nonzero & you are in the middle of dual tone
elseif((~any(rowFiltChunk == 0)) || (~any(colFiltChunk == 0)) && position == 1)
          
     %calculate the average frequency within the chunk 
     rowChunkAvg = sum(rowFiltChunk)/chunkSize;
     colChunkAvg = sum(colFiltChunk)/chunkSize;
      
     %add the average to frequency list    
     rowFreqList(bb) = rowChunkAvg;
     colFreqList(bb) = colChunkAvg;
     %increment index of frequency list 
     bb = bb + 1;
     
%elseif the chunk is (close to) zero & you were in the middle of a dual-tone          
elseif((any(rowFiltChunk >= 0) && any(rowFiltChunk <= 0.9)) || (any(colFiltChunk >= 0) && any(colFiltChunk <= 0.9)) && position == 1)
   
    %use the freq estimate list to output the freq estimate for that dual-tone  
    rowFreqAvg(cc) = sum(rowFreqList)/length(rowFreqList);
    colFreqAvg(cc) = sum(colFreqList)/length(colFreqList);
    
    %reset every needed variable cos we're going into another tone
    cc = cc + 1;
    rowChunkAvg = 0;
    colChunkAvg = 0;
    rowFreqList = [];
    colFreqList = [];
    position = 0;
    bb = 1;

%elseif the chunk is zero & you were looking for a new dual tone
elseif(any(rowFiltChunk == 0)||any(colFiltChunk == 0)&& position == 0)
%do nothing for loop will skip to next chunk
end

end

%Convert to frequency in Hz
rows = ((rowFreqAvg*fs)/(2*pi));

c = (2*pi)-colFreqAvg;
cols = ((c*fs)/(2*pi));

%vectors that will hold the indices of the frequencies we have in
%TT.rowtones and TT.colTones
rtone = [];
ctone = [];


%now go through the stuff we just averaged and if it's valid, store it
%this is for rows
for j = 1:length(rows)
    for k = 1:length(TT.rowTones)
        if(abs(rows(j) - TT.rowTones(k)) < .02*TT.rowTones(k))
            rtone = [rtone k];
            break;
        end
    end
end
%cols
%TT.colTones(1,3)
%this is the same thing, but for cols
for m = 1:length(cols)
    for n = 1:length(TT.colTones)
        if(abs(cols(m) - TT.colTones(1,n)) <= .02*TT.colTones(1,n))
        %abs(cols(m) - 
        %TT.colTones(n)
            ctone = [ctone n];
            break;
        end
    end
end

%ctone
%now just see what button that cooresponded to in the TT struct
dkeys = [];
for p = 1:length(rtone)
    dkeys = [dkeys TT.keys(rtone(p), ctone(p))];
end    


