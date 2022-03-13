function [decrypt] = DecryptImage(cipher,key)
%DecryptImage decrypts the cipher image using a key image
%Input:  A 2D array of uint8 values containing the cipher image
%        A 2D array of uint8 values containg the key image
%Output: A 2D array of uint8 values containg the decrypted image
%Author: Tanishq Ranjith

%Find the size of the cipher image and convert both the cipher and key into
%doubles for calcuations
[m, n] = size(cipher);
a = double(cipher);
b = double(key);

%Nested for loops sorts through the key and cipher image to determine
%whether the pixel is black or white
for i = 1:m
    for j = 1:n
        c = a(i, j) + b(i, j);
        if c == 0
            decrypt(i, j) = 255;
        elseif c == 510
            decrypt(i, j) = 255;
        else
            decrypt(i, j) = 0;
        end
    end
end

%Convert the output array back into uint8 values 
decrypt = uint8(decrypt);
end

