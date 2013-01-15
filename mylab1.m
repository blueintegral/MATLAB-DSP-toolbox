tt = -1 : 0.003 : 1.2; 
xx = cos( 4.2*2*pi*tt ); 
zz = 1.6*exp(j*pi/4)*exp(j*4.2*2*pi*tt); 
plot( tt, xx, 'b-', tt, real(zz), 'r--', 0, 1, 'r*' ), grid on %<plot a sinusoid 
% the above line also plots a red * where zz hits 0 seconds.
title('TEST PLOT of a SINUSOID') 
xlabel('TIME (sec)') 
test = max(real(zz))
