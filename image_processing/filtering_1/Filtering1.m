%% Read image

I=imread('il_padrino.jpg');
I=rgb2gray(I); % turn the image into a grayscale image so it is represented
% by one 2D array, instead of 3.

%% work out FFT (fast Fourier Transform), shift it, magnitude and display
% 
F = fft2(I);
F = fftshift(F);
aF = abs(F);
lF=log(1+aF);
subplot(1,3,1);
imshow(I);
title('original');
subplot(1,3,2);
imshow(aF,[]);
title('F magnitude');
subplot(1,3,3);
imshow(lF,[]);
title('F log');


%% Filtering: squared mask in the Fourier Domain 

[lowSF, highSF] = rectLHfilter(I,40,40);

% low filter: grab only frequencies below a upper trheshold.
LS = F.*lowSF;
LS = ifftshift(LS);
LS = ifft2(LS);
figure; subplot(2,2,1); imshow(real(LS),[]); title('low-pass sq filter');
subplot(2,2,3); imshow(lowSF); title('used mask');
% high filter: grab only frequencies above a lower trheshold.
HS = F.*highSF;
HS = ifftshift(HS);
HS = ifft2(HS);
subplot(2,2,2); imshow(real(HS),[]); title('high-pass sq filter');
subplot(2,2,4); imshow(highSF); title('used mask');

%% Filtering: Round Mask in the Fourier Domain

[lowRF, highRF] = roundLHfilter(I,40);

%low filter
LR = F.*lowRF;
LR = ifftshift(LR);
LR = ifft2(LR);
figure; subplot(2,2,1); imshow(real(LR),[]); title('low-pass rnd filter');
subplot(2,2,3); imshow(lowRF); title('used mask');
%high filter
HR = F.*highRF;
HR = ifftshift(HR);
HR = ifft2(HR);
subplot(2,2,2); imshow(real(HR),[]); title('high-pass rnd filter');
subplot(2,2,4); imshow(highRF); title('used mask');

%% Middle Filters
% these filters grab frequencies within an interval between lower and an
% upper thresholds. 

%% Middle Square filter 

%square filter 
[midSF, inmidSF] = SqMidfilter(I,100,80,50,40);

%direct
MS = F.*midSF;
MS = ifftshift(MS);
MS = ifft2(MS);
figure; subplot(2,2,1); imshow(real(MS),[]); title('MidPass sq filter');
subplot(2,2,3); imshow(midSF); title('used mask');

%inverse
inMS = F.*inmidSF;
inMS = ifftshift(inMS);
inMS = ifft2(inMS);
subplot(2,2,2); imshow(real(inMS),[]); title('Inverse MidPass sq filter');
subplot(2,2,4); imshow(inmidSF); title('used mask');

%% Middle Round filter 

% roundfilter
[midRF, inmidRF] = RnMidfilter(I,30,60);

%direct
MR = F.*midRF;
MR = ifftshift(MR);
MR = ifft2(MR);
figure; subplot(2,2,1); imshow(real(MR),[]); title('MidPass sq filter');
subplot(2,2,3); imshow(midRF); title('used mask');

%inverse
inMR = F.*inmidRF;
inMR = ifftshift(inMR);
inMR = ifft2(inMR);
subplot(2,2,2); imshow(real(inMR),[]); title('Inverse MidPass sq filter');
subplot(2,2,4); imshow(inmidRF); title('used mask');
