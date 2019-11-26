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

[x1, fs] = audioread('Audio.mp3');
audio=x1'; 
audio = audio(:,1:fs*5*60); % 5min cut in audio file
audioL=audio(1,:); %canal esquerdo
audioR=audio(2,:); %canal direito


%%%% Noise Generating Functions

n=(1:30*fs); % 30 second section

% S1: sine wave noise 400Hz-800Hz
Fruido = randi([400 800],1,1);
S1=2*sin(2*pi*(Fruido/fs)*n);
for delta1=0 : 100
    Fruido = randi([400 800],1,1);
    Sx1 = 2*sin(2*pi*(Fruido/fs)*n);
    S1 = S1 + Sx1;
end
S1 =S1/25;
%%%%

% S2: sine wave noise 1000Hz-1200Hz 
Fruido = randi([1000 1200],1,1);
S2=2*sin(2*pi*(Fruido/fs)*n);
for delta2=0 : 100 
    Fruido = randi([1000 1200],1,1);
    Sx2 = 2*sin(2*pi*(Fruido/fs)*n);
    S2 = S2 + Sx2;
end
S2 = S2/25;
%%%%

% S3: sine wave noise 200Hz-500Hz 
Fruido = randi([200 500],1,1);
S3=2*sin(2*pi*(Fruido/fs)*n);
for delta3=0 : 100
    Fruido = randi([200 500],1,1);
    Sx3 = 2*sin(2*pi*(Fruido/fs)*n);
    S3 = S3 + Sx3;
end
S3 = S3/25;
%%%%

% S4: sine wave noise 300Hz-600Hz 
Fruido = randi([300 600],1,1);
S4=2*sin(2*pi*(Fruido/fs)*n);
for delta4=0 : 100
    Fruido = randi([300 600],1,1);
    Sx4 = 2*sin(2*pi*(Fruido/fs)*n);
    S4 = S4 + Sx4;
end
S4 = S4/25;
%%%%

% S5: sine wave noise 1900Hz-2300Hz 
Fruido = randi([1900 2300],1,1);
S5=2*sin(2*pi*(Fruido/fs)*n);
for delta5=0 : 100
    Fruido = randi([1900 2300],1,1);
    Sx5 = 2*sin(2*pi*(Fruido/fs)*n);
    S5 = S5 + Sx5;
end
S5 = S5/25;
%%%%

% S6: sine wave noise 1700Hz-2000Hz 
Fruido = randi([1700 2000],1,1);
S6=2*sin(2*pi*(Fruido/fs)*n);
for delta6=0 : 100
    Fruido =  randi([1700 2000],1,1);
    Sx6 = 2*sin(2*pi*(Fruido/fs)*n);
    S6 = S6 + Sx6;
end
S6 = S6/25;
%%%%

% S7: sine wave noise 500Hz-700Hz 
Fruido = randi([500 700],1,1);
S7=2*sin(2*pi*(Fruido/fs)*n);
for delta7=0 : 100
    Fruido = randi([500 700],1,1);
    Sx7 = 2*sin(2*pi*(Fruido/fs)*n);
    S7 = S7 + Sx7;
end
S7 = S7/25;
%%%%

% S8: sine wave noise 2200Hz-2600Hz 
Fruido = randi([2200 2600],1,1);
S8=2*sin(2*pi*(Fruido/fs)*n);
for delta8=0 :100
    Fruido = randi([2200 2600],1,1);
    Sx8 = 2*sin(2*pi*(Fruido/fs)*n);
    S8 = S8 + Sx8;
end
S8 = S8/25;
%%%%

% S9: sine wave noise 100Hz-200Hz 
Fruido = randi([100 200],1,1);
S9=2*sin(2*pi*(Fruido/fs)*n);
for delta9=0 : 100
    Fruido = randi([100 200],1,1);
    Sx9 = 2*sin(2*pi*(Fruido/fs)*n);
    S9 = S9 + Sx9;
end
S9 = S9/25;
%%%%

% S10: sine wave noise 3800Hz-4400Hz 
Fruido = randi([3800 4400],1,1);
S10=2*sin(2*pi*(Fruido/fs)*n);
for delta10=0 : 100
    Fruido = randi([3800 4400],1,1);
    Sx10 = 2*sin(2*pi*(Fruido/fs)*n);
    S10 = S10 + Sx10;
end
S10 = S10/25;
%%%%

% Adição dos ruidos ao audio
audioL(1:30*fs) = audioL(1:30*fs) + S1;
audioL(1+(30*fs):60*fs)   = audioL(1+(30*fs):60*fs)   + S2;
audioL(1+(60*fs):90*fs)   = audioL(1+(60*fs):90*fs)   + S3;
audioL(1+(90*fs):120*fs)  = audioL(1+(90*fs):120*fs)  + S4;
audioL(1+(120*fs):150*fs) = audioL(1+(120*fs):150*fs) + S5;
audioL(1+(150*fs):180*fs) = audioL(1+(150*fs):180*fs) + S6;
audioL(1+(180*fs):210*fs) = audioL(1+(180*fs):210*fs) + S7;
audioL(1+(210*fs):240*fs) = audioL(1+(210*fs):240*fs) + S8;
audioL(1+(240*fs):270*fs) = audioL(1+(240*fs):270*fs) + S9;
audioL(1+(270*fs):300*fs) = audioL(1+(270*fs):300*fs) + S10;

audioR(1:30*fs) = audioR(1:30*fs) + S10;
audioR(1+(30*fs):60*fs)   = audioR(1+(30*fs):60*fs)   + S9;
audioR(1+(60*fs):90*fs)   = audioR(1+(60*fs):90*fs)   + S8;
audioR(1+(90*fs):120*fs)  = audioR(1+(90*fs):120*fs)  + S7;
audioR(1+(120*fs):150*fs) = audioR(1+(120*fs):150*fs) + S6;
audioR(1+(150*fs):180*fs) = audioR(1+(150*fs):180*fs) + S5;
audioR(1+(180*fs):210*fs) = audioR(1+(180*fs):210*fs) + S4;
audioR(1+(210*fs):240*fs) = audioR(1+(210*fs):240*fs) + S3;
audioR(1+(240*fs):270*fs) = audioR(1+(240*fs):270*fs) + S2;
audioR(1+(270*fs):300*fs) = audioR(1+(270*fs):300*fs) + S1;


audio_ruido(1,:) = audioL;
audio_ruido(2,:) = audioR;
audio_ruido=audio_ruido';
audiowrite('AudioWithNoise.wav', audio_ruido, fs)









