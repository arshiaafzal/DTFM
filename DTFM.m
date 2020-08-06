%%
clc;
clear;
Fs=8192;
load('filt_697.mat');
load('filt_770.mat');
load('filt_852.mat');
load('filt_941.mat');
load('filt_1209.mat');
load('filt_1336.mat');
load('filt_1477.mat');
load('filt_1633.mat');

[h1,w1]=freqz(filt_697);
[h2,w2]=freqz(filt_770);
[h3,w3]=freqz(filt_852);
[h4,w4]=freqz(filt_941);
[h5,w5]=freqz(filt_1209);
[h6,w6]=freqz(filt_1336);
[h7,w7]=freqz(filt_1477);
[h8,w8]=freqz(filt_1633);

f1=w1/2/pi*Fs;
f2=w2/2/pi*Fs;
f3=w3/2/pi*Fs;
f4=w4/2/pi*Fs;
f5=w5/2/pi*Fs;
f6=w6/2/pi*Fs;
f7=w7/2/pi*Fs;
f8=w8/2/pi*Fs;

figure;
% 697 Hz
subplot(4,2,1)
semilogy(f1,abs(h1));
title('697Hz');
xlim([0 4000]);
% 770 Hz
subplot(4,2,2)
semilogy(f2,abs(h2));
title('770Hz');
xlim([0 4000]);
% 852 Hz
subplot(4,2,3)
semilogy(f3,abs(h3));
title('852Hz');
xlim([0 4000]);
% 941 Hz
subplot(4,2,4)
semilogy(f4,abs(h4));
title('941Hz');
xlim([0 4000]);
% 1209 Hz
subplot(4,2,5)
semilogy(f5,abs(h5));
title('1209Hz');
xlim([0 4000]);
% 1336 Hz
subplot(4,2,6)
semilogy(f6,abs(h6));
title('1336Hz');
xlim([0 4000]);
% 1477 Hz
subplot(4,2,7)
semilogy(f7,abs(h7));
title('1477Hz');
xlim([0 4000]);
% 1633 Hz
subplot(4,2,8)
semilogy(f8,abs(h8));
title('1633Hz');
xlim([0 4000]);
figure;
[y,Fs]=audioread('DialedSequence_NoNOise.wav');
t=linspace(0,length(y),length(y));
subplot(5,2,1)
plot(t,y); title('before noise removal');
Nr=filt_697+filt_770+filt_852+filt_941+filt_1209+filt_1336+filt_1477+filt_1633;
y2=filter(Nr,1,y);
subplot(5,2,2)
plot(t,y2); title('after noise removal');
nonoise=number(y2)

[y,Fs]=audioread('DialedSequence_SNR00dB.wav');
t=linspace(0,length(y),length(y));
subplot(5,2,3)
plot(t,y); title('before noise removal');
Nr=filt_697+filt_770+filt_852+filt_941+filt_1209+filt_1336+filt_1477+filt_1633;
y2=filter(Nr,1,y);
subplot(5,2,4)
plot(t,y2);title('after noise removal');
snr00dB=number(y2)

[y,Fs]=audioread('DialedSequence_SNR10dB.wav');
t=linspace(0,length(y),length(y));
subplot(5,2,5)
plot(t,y); title('before noise removal');
Nr=filt_697+filt_770+filt_852+filt_941+filt_1209+filt_1336+filt_1477+filt_1633;
y2=filter(Nr,1,y);
subplot(5,2,6)
plot(t,y2);title('after noise removal');
snr10dB=number(y2)

[y,Fs]=audioread('DialedSequence_SNR20dB.wav');
t=linspace(0,length(y),length(y));
subplot(5,2,7)
plot(t,y); title('before noise removal');
Nr=filt_697+filt_770+filt_852+filt_941+filt_1209+filt_1336+filt_1477+filt_1633;
y2=filter(Nr,1,y);
subplot(5,2,8)
plot(t,y2);title('after noise removal');
snr20dB=number(y2)  
  
[y,Fs]=audioread('DialedSequence_SNR30dB.wav');
t=linspace(0,length(y),length(y));
subplot(5,2,9)
plot(t,y); title('before noise removal');
Nr=filt_697+filt_770+filt_852+filt_941+filt_1209+filt_1336+filt_1477+filt_1633;
y2=filter(Nr,1,y);
subplot(5,2,10)
plot(t,y2);title('after noise removal');
snr30dB=number(y2)     






%%             functions
%%
function s = finddigit(y)
load('filt_697.mat');
load('filt_770.mat');
load('filt_852.mat');
load('filt_941.mat');
load('filt_1209.mat');
load('filt_1336.mat');
load('filt_1477.mat');
load('filt_1633.mat');
y_697=filter(filt_697,1,y);
y_770=filter(filt_770,1,y);
y_852=filter(filt_852,1,y);
y_941=filter(filt_941,1,y);
y_1209=filter(filt_1209,1,y);
y_1336=filter(filt_1336,1,y);
y_1477=filter(filt_1477,1,y);
y_1633=filter(filt_1633,1,y);
s="/";
% finding the digits by filtering them
% 1_A
if(max(y_697)>0.1)
    if(max(y_1209)>0.1)
        s="1";
    end
     if(max(y_1336)>0.1)
        s="2";
     end
     if(max(y_1477)>0.1)
        s="3";
     end
     if(max(y_1633)>0.1)
        s="A";
     end
end
%4_B
if(max(y_770)>0.1)
    if(max(y_1209)>0.1)
        s="4";
    end
     if(max(y_1336)>0.1)
        s="5";
     end
     if(max(y_1477)>0.1)
        s="6";
     end
     if(max(y_1633)>0.1)
        s="B";
     end
end
%7_C
if(max(y_852)>0.1)
    if(max(y_1209)>0.1)
        s="7";
    end
     if(max(y_1336)>0.1)
        s="8";
     end
     if(max(y_1477)>0.1)
        s="9";
     end
     if(max(y_1633)>0.1)
        s="C";
     end
end
%*_D
if(max(y_941)>0.1)
    if(max(y_1209)>0.1)
        s="*";
    end
     if(max(y_1336)>0.1)
        s="0";
     end
     if(max(y_1477)>0.1)
        s="#";
     end
     if(max(y_1633)>0.1)
        s="D";
     end
end


end
%%
function s=number(y2)

Et=sum(y2.^2)/16;
s="number is : ";
c="hello";
E=Et;l=0; % initializing the energy
n=100;
for i=1:n:length(y2)-n

if(i+1600>length(y2))
   i=length(y2)-1600; % just to make sure it doesen't exceeds the length(y2) 
end
if(finddigit(y2(i:i+1000))~=c && finddigit(y2(i:i+1000))~="/" )
s=s+finddigit(y2(i:i+1000));
c=finddigit(y2(i:i+1000));
end
    




end
end