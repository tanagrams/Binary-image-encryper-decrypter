function [encrypted] = EncryptImage(binary,key)
%EncryptImage will encrypt a binary image using a key of patterns to create
%an encrypted cipher array
%Input:  A 2D array of uint8 values containing he binary image to encrypt
%        A 2D cell array of 2x2 patterns which is the key
%Output: A 2D cell array of 2x2 patterns which is our cipher array, each
%        element in the array is a 2x2 patterns of uint8 values
%Author: Tanishq Ranjith 

%Find the size of the binary image
[m, n] = size(binary);

%Nested for loops to go through and replace each pixel with a corresponding
%pattern
for i = 1:m
    for j = 1:n
        if binary(i, j) < 128
            encrypted{i, j} = ImageComplement(key{i, j});
        else
            encrypted{i, j} = key{i, j};
        end
    end
end
end

