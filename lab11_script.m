%play the star spangled banner
clear
clc

multiplier = 1.5;

x1 = GenerateSound(392,'AO', (3/16)*multiplier);
x2 = GenerateSound(329.63,'AO', (1/16)*multiplier);
x3 = GenerateSound(261.63,'EH', (1/4)*multiplier);
x4 = GenerateSound(329.63,'AA', (1/4)*multiplier);
x5 = GenerateSound(392,'UW', (1/4)*multiplier);
x6 = GenerateSound(523.25,'IY', (1/2)*multiplier);

x7 = GenerateSound(659.26,'AA', (3/16)*multiplier);
x7h = GenerateSound(550.3,'AA', (3/16)*multiplier);
x8 = GenerateSound(587.32,'EH', (1/16)*multiplier);
x9 = GenerateSound(523.25,'AO', (1/4)*multiplier);
%x9h = GenerateSound(311.3,'A0', (1/4)*multiplier);
x10 = GenerateSound(329.63,'EH', (1/4)*multiplier);

x11 = GenerateSound(369.99,'IY', (1/4)*multiplier);
%x11h = GenerateSound(290.66,'IY', (1/4)*multiplier);
x12 = GenerateSound(392,'AA',(3/8)*multiplier);
%x12h = GenerateSound(493.66,'AA', (3/8)*multiplier);

x7n = (x7+x7h);
%x9n = (x9+x9h);
%x11n = (x11+x11h);
%x12n = (x12+x12h);

final = [x1 x2 x3 x4 x5 x6 x7n x8 x9 x10 x11 x12];
wavwrite(final, 'starspangledbanner.wav');
soundsc(final,8000);