I=rgb2gray(imread('il_padrino.jpg'));

I=imnoise(I,'salt & pepper',0.01);

%% here we're playing around with Butterworth Filters ! 

[hPmask,lPmask]=Butterworth(I,10,1);

figure;
subplot(1,3,1), imshow(I), title('original');
subplot(1,3,2), imshow(real(ifft2(ifftshift( ( fftshift(fft2(I)).*hPmask ) ))), [] ), title('high pass');
subplot(1,3,3), imshow(real(ifft2(ifftshift( ( fftshift(fft2(I)).*lPmask ) ))), [] ), title('low pass');

%% now we'll check how this work with Gaussian and Median Spatial smoothing
figure;
subplot(1,3,1), imshow(I), title('original');
subplot(1,3,2), imshow(Gaussian(I,5,5,1)), title('Gaussian Filter');
subplot(1,3,3), imshow(Median(I)), title('Median');

%% here we check what happens if we apply first the median and then the other one
I=imnoise(I,'gaussian',0.1);
figure;
subplot(1,3,1), imshow(I), title('original');   
II=Median(I);
subplot(1,3,2), imshow(II), title('Median');
subplot(1,3,3), imshow(Gaussian(II,5,5,1)), title('Gaussian Filter');
