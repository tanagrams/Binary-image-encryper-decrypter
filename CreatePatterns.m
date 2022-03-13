function [patterns] = CreatePatterns()
%CreatePatterns creates a 1D cell array with six 2x2 patterns of uint8
%values
%Input: None
%Output: A 1x6 cell array of six patterns where each patterns is stored
%as a 2x2 uint8 value array
%Author: Tanishq Ranjith

%Create the possible combinations and store as them as uint8 values
p1 = uint8([255, 255; 0, 0]);
p2 = uint8(ImageComplement(p1));
p3 = uint8([0, 255; 0, 255]);
p4 = uint8(ImageComplement(p3));
p5 = uint8([0, 255; 255, 0]);
p6 = uint8(ImageComplement(p5));

%Put the possible combination into a cell array
patterns = {p1, p2, p3, p4 , p5 , p6};       
end

