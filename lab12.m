
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
fs = 300;  % Sampling frequency
f = 101.4;   % Location of notch

r = 0.95;  % Control parameter. 0 < r < 1.

A = ones(3,1);
B = A;

cW = cos(2*pi*f/fs);

A(2) = -2*r*cW;
A(3) = r^2;
B(2)= -2*cW;


% A = p_values;
% B = z_values;

figure(1); % look at the frequency response of the filter
freqz(B,A);
title('sampling frequency 300Hz, notch @ 101.4Hz');

figure(2);
plot(1:length(ecgsig), ecgsig)
%plot(ecgsig);
figure(3)
spectrogram(ecgsig)
title('Original Signal');
cleaned = filter(B, A, ecgsig);

figure(4);
plot(1:length(ecgsig), cleaned)
%plot(cleaned)
figure(5);
spectrogram(cleaned)
title('Cleaned Signal');

%now use poly() to get the IIR coefficients
%poly([(-0.5220 + 0.8529i) (-0.5220 - 0.8529i) (-0.4959 + 0.8103i) (-0.4959
%- 0.8103i)]);

%what that does is takes in [z p] roots exported from PeZdemo to get the
%coefficients of the IIR difference equation.











































%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
What this filter does, is that it puts a zero exatly on the unit circle

at the 101.4 Hz line. The zero removes the line at 101.4 Hz, but pulls
down the surounding frequencies too. To counter that, a pole
is put just inside the unit circle to push the frequency
response back up.

The notch is put on the nominal location of the interfering line
by choosing the ratio f/fs. The width of the notch is controlled
by the parameter r.

This approach ought to give a little better control and leeway
than setting the spectrum coefficient to 0.
%}