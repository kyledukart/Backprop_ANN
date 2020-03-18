function [P, T] = inputPatterns()
    % creates vectors corresponding to each of the numbers 0-2 in a 5x3 matrix,
    % reading each column one at a time.
    zero = [-1,1,1,1,1,-1,1,-1,-1,-1,-1,1,1,-1,-1,-1,-1,1,1,-1,-1,-1,-1,1,-1,1,1,1,1,-1];
    one = [-1,-1,-1,-1,-1,-1,1,-1,-1,-1,-1,-1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
    two = [1,-1,-1,-1,-1,-1,1,-1,-1,1,1,1,1,-1,-1,1,-1,1,-1,1,1,-1,-1,1,-1,-1,-1,-1,-1,1];
    P = [zero' one' two'];
    
    T = [1,0,0;0,1,0;0,0,1];
end