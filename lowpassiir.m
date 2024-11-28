clc;
clear all;
close all;

% Set default values for filter specifications
rp = 1;         % Default passband ripple (dB)
rs = 40;        % Default stopband attenuation (dB)
wp = 1000;      % Default passband frequency (Hz)
ws = 1500;      % Default stopband frequency (Hz)
fs = 5000;      % Default sampling frequency (Hz)

% Display default values
disp('Using default filter specifications:');
disp(['Passband Ripple (dB): ', num2str(rp)]);
disp(['Stopband Attenuation (dB): ', num2str(rs)]);
disp(['Passband Frequency (Hz): ', num2str(wp)]);
disp(['Stopband Frequency (Hz): ', num2str(ws)]);
disp(['Sampling Frequency (Hz): ', num2str(fs)]);

% Calculate normalized frequencies
w1 = 2 * wp / fs;  % Normalized passband frequency
w2 = 2 * ws / fs;  % Normalized stopband frequency

% Determine filter order using buttord
[n, wn] = buttord(w1, w2, rp, rs);

% Design Butterworth low-pass filter using butter
[b, a] = butter(n, wn, 'low');

% Frequency response
[H, F] = freqz(b, a, 512, fs);

% Plot magnitude response
subplot(2, 1, 1);
plot(F, 20*log10(abs(H)));
title('Magnitude Response of Low-Pass IIR Filter');
xlabel('Frequency (Hz)');
ylabel('Gain (dB)');
grid on;

% Plot phase response
subplot(2, 1, 2);
plot(F, angle(H));
title('Phase Response of Low-Pass IIR Filter');
xlabel('Frequency (Hz)');
ylabel('Phase (Radians)');
grid on;
