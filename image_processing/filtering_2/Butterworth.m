function [hPmask, lPmask] = Butterworth(I,d,n)
% This function takes as inputs an image I, the cutoff freq. d, and the
% filter order n, and returns both masks for high and low pass filters to
% be applied in the frecquency domain.


[r, c]=size(I);

%here the mapping of the grid we'll be used to draw de mask: 
[X, Y] = meshgrid(-floor(c/2):floor((c-1)/2),-floor(r/2):floor((r-1)/2));

hPmask = 1./(1.+(d./( X.^2 +Y.^2).^0.5).^(2*n));

lPmask = imcomplement(hPmask);

end
