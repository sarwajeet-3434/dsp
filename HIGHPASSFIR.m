clc;
clear;
fs = 1000;        
wp = 200;        
ws = 300;        
n = 20;           
filterType = 'highpass';  


if strcmp(filterType, 'lowpass')
    b = fir1(n, wp / (fs / 2), 'low', hamming(n + 1));
elseif strcmp(filterType, 'highpass')
    b = fir1(n, wp / (fs / 2), 'high', hamming(n + 1));
end


[h, f] = freqz(b, 1, 512, fs);


subplot(2, 1, 1);
plot(f, abs(h));   
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Gain (dB)');


subplot(2, 1, 2);
plot(f, angle(h)); 
title('Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');