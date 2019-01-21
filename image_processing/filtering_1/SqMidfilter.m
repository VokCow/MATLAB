function [midF, inmidF] = SqMidfilter(I,mm,nn,m,n)
% This function takes an image I and the desireded mask size as inputs, gets
% image size from I and returns the desired mask binary image. The mask is
% described as m<x<mm, n<y<nn.

[rows, cols] = size(I);
crows=rows/2; ccols=cols/2;
midF = zeros(rows,cols);
midF((crows-mm:crows+mm),(ccols-nn:ccols+nn))=1;
midF((crows-m:crows+m),(ccols-n:ccols+n))=0;
inmidF=imcomplement(midF);

end
