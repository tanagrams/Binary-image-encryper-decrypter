function [image] = ExtractImage(col)
%ExtractImage extracts a binary image that has been embedded in a colour
%image
%Input:  A 3D array of uint8 values that contains a binary image hidden in
%        it
%Output: A 2D array of uint8 values of the binary image that was embedded
%        in the colour image
%Author: Tanishq Ranjith

%Find the size of the coloured image and convert to doubles to perform
%calcuations
[m, n, o] = size(col);
rcol = double(col);

%Nested for loops that goes through the colour image and extracts the
%binary image
for i = 1:m
    for j = 1:n
        a = rcol(i, j, 1) + rcol(i, j, 2) + rcol(i, j, 3);
        
        if mod(a, 2) == 0 
            image(i, j) = 0;
        else
            image(i, j) = 255;
        end
    end
end
%Convert our output array back into uint8 values
image = uint8(image);
end

