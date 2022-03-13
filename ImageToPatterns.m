function [carray] = ImageToPatterns(blacknwhite)
%ImageToPatterns converts a image into a cell array of 2x2 uint8 patterns
%Input:  A 2D array of uint8 values (image)
%Output: A 2D cell array of 2x2 patterns extracted from the image where
%        each element is a 2x2 uint8 array of values
%Author: Tanishq Ranjith

%Find the size of the black and white image array
[m, n] = size(blacknwhite);

%Find out how many 2x2 arrays can be made
a = m/2;
b = n/2;

%Create arrays that will specify the dimensions for mat2cell
c(1:a) = 2;
d(1:b) = 2;

%Use mat2cell to split array into 2x2 patterns 
carray = mat2cell(blacknwhite, c, d);
end

