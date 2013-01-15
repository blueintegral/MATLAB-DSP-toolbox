function [xx, tt] = add_sines(freqs, Camps, dur, tstart)
%documentation goes here

%check for errors/sanitize input
if length(freqs) ~= length(Camps)
    error('the number of frequencies and complex amplitudes is not the same. check your input.')
end
%initialize
xx = [0];
%find the largest frequency to satisfy samples per shortest period
hifreq = max(freqs);
tt= tstart:1/(32*hifreq):(tstart+dur);

%loop to sum all the sinusoids
for i = 1:length(freqs)
xx = xx + real(Camps(i)*exp(j*freqs(i)*2*pi*tt)); 
end

average = sum(xx)/length(xx)
sprintf('%d', average)


end
