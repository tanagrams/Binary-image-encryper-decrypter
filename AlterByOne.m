function [numaltered] = AlterByOne(num)
%AlterByOne will add one to the value that is inputted unless the value is
%255 in which case it will substract one
%Input: An integer value between 0 and 255 inclusive
%Output: A uint8 value that has been been altered by one
%Author: Tanishq Ranjith

%Check if the number is less then 255 and add one to it

if num < 255            
    a = num + 1;        
elseif num == 255       %If the number is 255 minus one from it
    a = num - 1;
end
numaltered = uint8(a);   %Make sure the output is a unsigned 8 bit integer
end

