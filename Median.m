function mfI=Median(I)
% This functions apply a median filter onto an image to smooth it. Input is
% the image in which is needed to perform the filter.
[m, n] = size(I);
mfI = uint8(zeros(m,n));

    for i=1:m
        for j=1:n 
            % first, min and max calues for x and y are defined
            xmin = max(1,i-1);
            xmax = min(m,i+1);
            ymin = max(1,j-1);
            ymax = min(n,j+1);
            % the neighbourhood matrix will then be
            temp = I(xmin:xmax, ymin:ymax);
            mfI(i,j)= median(temp(:));
        end
    end
end
