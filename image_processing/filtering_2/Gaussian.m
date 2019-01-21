function gfI = Gaussian(I,n,m,sigma)

% This function performs a Gaussian Spatial smoothing operation through
% convolution of images pixels with a Gaussian core. Inputs are I (the
% image), n, m (dimensions of Gaussian core). No meshgrid is used to design
% the Gaussian core, and sigma (standard deviation).

%I=rgb2gray(I);
kernel = zeros(n,m);
W=0;

for i = 1:n
    for j=1:m
        sq_dist = (i-ceil(n/2))^2+(j-ceil(m/2));
        kernel(i,j) = exp(-1^(sq_dist)/(2*sigma^2));
        W=W+kernel(i,j);
    end
end
kernel=kernel/W;    

[r, c] = size(I);
gfI = zeros(r,c);
Im = padarray(I,[floor(n/2) floor(m/2)]);

for i=1:r
    for j=1:c
        temp=double(Im(i:i+n-1,j:j+m-1));
        conv = temp.*kernel;
        gfI(i,j)=sum(conv(:));
    end
end

gfI=uint8(gfI);

end
