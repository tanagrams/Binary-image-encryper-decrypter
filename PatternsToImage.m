function [together] = PatternsToImage(seperate)
%PatternsToImage converts a 2D cell array of patterns into a 2D uint8 array
%which creates a greyscale image that can be displayed
%Input:  A 2D cell array of 2x2 uint8 patterns 
%Output: A 2D array of uint8 values where the pixels are arranged into a
%        single image that will be twice the size of the input array

%Convert the cell array into a single uint8 array
together = cell2mat(seperate);

end

