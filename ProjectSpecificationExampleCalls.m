% 2021 Visual Cryptography project specification example calls
% You may find it useful to use these calls for testing

% Author: Peter Bier

clear; % a good idea to use clear before testing any function

%% AlterByOne

v = AlterByOne(0) % should return 1
v = AlterByOne(10) % should return 11
v = AlterByOne(128) % should return 129
v = AlterByOne(255) % should return 254

%% ImageComplement

blackRectangle = zeros(2,3,'uint8') % should be all zeros
whiteRectangle = ImageComplement(blackRectangle) % should be all 255
blackAgain = ImageComplement(whiteRectangle) % should be all zeros

p = uint8([254 255; 0 1])
c = ImageComplement(p)
% c should have values
%      1     0
%    255   254

rng(0) % use the seed just before calling rand, otherwise you will get different random values
r = uint8(255*rand(3,4))
c = ImageComplement(r)
% c should have values
%     47    22   184     9
%     24    94   116   215
%    223   230    11     7

%% CreatePatterns

p = CreatePatterns()
pattern1 = p{1} % note curly braces
% pattern1 should have values
% 255   255
%   0	  0
pattern3 = p{3} % note curly braces
% pattern3 should have values
%      0   255
%      0   255

%%%%% GenerateKey

r = [3 5 1 3; 1 6 5 6; 5 4 2 3];
p = CreatePatterns();
key = GenerateKey(r,p)
key{1,1} % note curly braces
% should have values
%   0   255
%   0	255
key{2,3} % note curly braces
% should have values
%     0   255
%   255     0

%% PatternsToImage

patternArrayRow = { uint8([ 0 0; 255 255]), uint8([0 255; 255 0]) }
im = PatternsToImage(patternArrayRow)
% im should have values
%     0     0     0   255
%   255   255   255     0

patternArrayCol = { uint8([ 0 0; 255 255]); uint8([0 255; 255 0])}
im = PatternsToImage(patternArrayCol)
% im should have values
%      0     0
%    255   255
%      0   255
%    255     0

r = [3 5 1 3; 1 6 5 6; 5 4 2 3];
p = CreatePatterns();
key = GenerateKey(r,p)
keyImage = PatternsToImage(key)
% keyImage should have values
%      0   255     0   255   255   255     0   255
%      0   255   255     0     0     0     0   255
%    255   255   255     0     0   255   255     0
%      0     0     0   255   255     0     0   255
%      0   255   255     0     0     0     0   255
%    255     0   255     0   255   255     0   255

%% EmbedImage

binary = uint8([ 0 255; 255 0])
% note random values below are for version 3 of the project spec
% version 1 had different values
rng(0) % use the seed just before calling rand, otherwise you will get different random values
colour = uint8(255*rand(2,2,3)) 
% colour values will be as follows:
% colour(:,:,1) =
%    208    32
%    231   233
% 
% colour(:,:,2) =
%    161    71
%     25   139
% 
% colour(:,:,3) =
%    244    40
%    246   248

hidden = EmbedImage(binary,colour)
% hidden values will be as follows:
% hidden(:,:,1) =
%    209    32
%    232   233
% 
% hidden(:,:,2) =
%    161    71
%     25   139
% 
% hidden(:,:,3) =
%    244    40
%    246   248

%% ImageToPatterns

im = uint8([0 0 0 255; 255 255 255 0])
% im will have values
%      0     0     0   255
%    255   255   255     0
p = ImageToPatterns(im)
% p will be a  1×2 cell array containing 2×2 uint8 matrices

p1 = p{1} % note curly braces
% p1 will be a 2×2 uint8 matrix with values
%     0     0
%   255   255

p2 = p{2} % note curly braces
% p2 will be 2×2 uint8 matrix with values
%     0   255
%   255     0

image = uint8([     0   255     0   255   255   255     0   255;
                    0   255   255     0     0     0     0   255;
                  255   255   255     0     0   255   255     0;
                    0     0     0   255   255     0     0   255;
                    0   255   255     0     0     0     0   255;
                  255     0   255     0   255   255     0   255; ]);
p = ImageToPatterns(image)
% p will be a 3×4 cell array containging 2×2 uint8 values
p13 = p{1,3}
% ans will be a 2×2 uint8 matrix with values
%   255   255
%     0     0

%% EncryptImage

tinyO = uint8([255 0 0 255; 0 255 255 0; 255 0 0 255])
% tinyO will be a 3×4 uint8 matrix with values
%    255     0     0   255
%      0   255   255     0
%    255     0     0   255

keyImage = uint8([     0   255     0   255   255   255     0   255;
                       0   255   255     0     0     0     0   255;
                     255   255   255     0     0   255   255     0;
                       0     0     0   255   255     0     0   255;
                       0   255   255     0     0     0     0   255;
                     255     0   255     0   255   255     0   255; ]);
keyArray = ImageToPatterns(keyImage)
% keyArray will be a 3×4 cell array containging 2×2 uint8
cipherArray = EncryptImage(tinyO,keyArray)
% cipherArray will be a 3×4 cell array containging 2×2 uint8

c11 = cipherArray{1,1}
% cl1 will be a 2×2 uint8 matrix with values
%   0   255
%   0	255

c12 = cipherArray{1,2}
% c12 will be a 2×2 uint8 matrix with values
%   255     0
%     0   255

%% ExtractImage

binary = uint8([ 0 255; 0 255])
colour = uint8(255*rand(2,2,3)); % random values  
hidden = EmbedImage(binary,colour)
original = ExtractImage(hidden)

% original will be a 2×2 uint8 matrix with values
%     0   255
%     0   255

hidden(:,:,1) = [178 242; 81 10];
hidden(:,:,2) = [112 195; 97 203];
hidden(:,:,3) = [48 114; 125 165];
hidden = uint8(hidden) % make sure it is of type uint8
m = ExtractImage(hidden)
% m will be of a 2×2 uint8 matrix with values
%     0   255
%   255     0

%% DecryptImage

cipherImage = uint8([  0   255   255     0     0     0     0   255;
                       0   255     0   255   255   255     0   255;]);

keyImage = uint8([     0   255     0   255   255   255     0   255;
                       0   255   255     0     0     0     0   255;]);

plainImage = DecryptImage(cipherImage,keyImage)

% plainImage will be a 2×8 uint8 matrix with values
%   255   255     0     0     0     0   255   255
%   255   255     0     0     0     0   255   255

cipherImage = uint8([  0   255   255     0     0     0     0   255;
                       0   255     0   255   255   255     0   255;
                       0     0   255     0     0   255     0   255;
                     255   255     0   255   255     0   255     0;
                       0   255     0   255   255   255     0   255;
                     255     0     0   255     0     0     0   255; ]);

keyImage = uint8([     0   255     0   255   255   255     0   255;
                       0   255   255     0     0     0     0   255;
                     255   255   255     0     0   255   255     0;
                       0     0     0   255   255     0     0   255;
                       0   255   255     0     0     0     0   255;
                     255     0   255     0   255   255     0   255; ]);

plainImage = DecryptImage(cipherImage,keyImage)
% plainImage will be a 6×8 uint8 matrix with values
%   255   255     0     0     0     0   255   255
%   255   255     0     0     0     0   255   255
%     0     0   255   255   255   255     0     0
%     0     0   255   255   255   255     0     0
%   255   255     0     0     0     0   255   255
%   255   255     0     0     0     0   255   255

