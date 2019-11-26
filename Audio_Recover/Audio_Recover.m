%-------------------------------------------------------------------------------
%   CENTRO UNIVERSITARIO FEI   
%   NEB110 - COMUNICACOES DIGITAIS I
%   PROJECT:  Audio Signal Processing
%
%   Authors:
%           BRUNO AUGUSTO CASU    12.218.121-7
%           BRUNO DUARTE          12.212.104-9 
%-------------------------------------------------------------------------------

clc
clear all
close all

[x1, fs] = audioread('AudioWithNoise.wav');

audio=x1'; 
audio = audio(:,1:fs*5*60); 
audioL=audio(1,:); %canal esquerdo
audioR=audio(2,:); %canal direito
recL=audio(1,:);
recR=audio(2,:);

n=(1:30*fs); 
Lfcsup = zeros(1,10);
Lfcinf = zeros(1,10);

Rfcsup = zeros(1,10);
Rfcinf = zeros(1,10);

for trecho=0 : 9
	N=length(n);
	f=(0:N-1)*(fs/N);
	W=fft(audioL(1 + trecho*(30*fs) : (trecho+1)*(30*fs)));
    
	[PKS,LOCS] = findpeaks(abs(W),f,'MinPeakHeight',50000);

	DELTA=LOCS(1:(length(LOCS))/2);

	Lfcsup(trecho+1)=DELTA(length(DELTA))+250;
	Lfcinf(trecho+1)=DELTA(1)-250;
	df=20;
	FILTRO_F = REJECT_BAND(df, Lfcsup(trecho+1), Lfcinf(trecho+1), fs);

	R = conv(FILTRO_F,audioL(1 + trecho*(30*fs) : (trecho+1)*(30*fs)) );
    R = conv(FILTRO_F, R);
    recL(1 + trecho*(30*fs) : (trecho+1)*(30*fs)) = R(1:length(n));
end

for trecho=0 : 9
	N=length(n);
	f=(0:N-1)*(fs/N);
	W=fft(audioR(1 + trecho*(30*fs) : (trecho+1)*(30*fs)));
    
	[PKS,LOCS] = findpeaks(abs(W),f,'MinPeakHeight',50000);

	DELTA=LOCS(1:(length(LOCS))/2);

	Rfcsup(trecho+1)=DELTA(length(DELTA))+250;
	Rfcinf(trecho+1)=DELTA(1)-250;
	df=20;
	FILTRO_F = REJECT_BAND(df, Rfcsup(trecho+1), Rfcinf(trecho+1), fs);

	R = conv(FILTRO_F,audioR(1 + trecho*(30*fs) : (trecho+1)*(30*fs)) );
    R = conv(FILTRO_F, R);
    recR(1 + trecho*(30*fs) : (trecho+1)*(30*fs)) = R(1:length(n));
end

audio(1,:) = recL;
audio(2,:) = recR;

audio=audio';
audiowrite('RecoveredAudio.wav', audio, fs)

%sound(recL,fs);








