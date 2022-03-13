function [complement] = ImageComplement(original)
%ImageComplement will find the complement of input array made from black 
%and white pixels, for example a black pixel with value 0 will become a 
%white pixel with value 255
%Input: A 2D array containing uint8 values (grayscale image) 
%Output: A 2D array that is the complement of the input array
%Author: Tanishq Ranjith

%To find the complement we just need to substract the original value from 
%255
complement = 255 - original;     
end

