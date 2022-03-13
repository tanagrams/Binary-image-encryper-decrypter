function [hidden] = EmbedImage(original,colour)
%EmbedImage embeds a black and white image into a colour image
%Input:  A 2D array containing uint8 values which is the greyscale image
%        A 3D array containing uint8 values which is the colour image that
%        the binray image will be embedded in
%Output: A 3D array of uint8 values that contains the binary image within
%        it

%Begin by finding the size of the greyscale image and converting the colour
%image into doubles so that we can perform calculations
[m, n] = size(original);
rcolour = double(colour);

%Nested for loops will scan through each pixel of the black and white and
%put it into the coloured image
for i = 1:m
    for j = 1:n
        a = rcolour(i, j, 1) + rcolour(i, j, 2)+ rcolour(i, j, 3);
        if (original(i, j) == 0)
            if mod(a, 2) == 1
                colour(i, j, 1) = AlterByOne(colour(i, j, 1));
            end
        end
        if (original(i, j) == 255)
            if mod(a, 2) == 0
                colour(i, j, 1) = AlterByOne(colour(i, j, 1));
            end
        end
    end
end

%Convert output array back into uint8 values
hidden = uint8(colour);
end

