function [key] = GenerateKey(random,patterns)
%GenerateKey creates a 2D cell array which will act as a key where each
%array element is a random 2x2 uint8 pattern.
%Input:  A 2D array containing random integers from 1-6 inclusive 
%        A 1x6 cell array of patterns where each pattern is a 2x2 uint8 array
%Output: A 2D cell array containing patterns which will act as the key
%        where each element is a 2x2 array of uint 8 values
%Author: Tanishq Ranjith

%Lets find the size of the random array
[m, n] = size(random)   

%Nested for loop to find the corresponding patterns for each random number
%and storing it into our output cell array
for i = 1:m
    for j = 1:n
        a{i, j} = uint8(patterns{random(i, j)});
    end
end
key = a;
end

