
% Frequency response
[H, F] = freqz(b, a, 512, fs);

% Plot magnitude response
subplot(2, 1, 1);
plot(F, 20*log10(abs(H)));
title('Magnitude Response of Low Pass IIR Filter');
xlabel('Frequency (Hz)');
ylabel('Gain (dB)');

% Plot phase response
subplot(2, 1, 2);
plot(F, angle(H));
title('Phase Response of Low Pass IIR Filter');
xlabel('Frequency (Hz)');
ylabel('Phase (Radians)');
