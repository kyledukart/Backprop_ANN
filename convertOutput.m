% Converts the MNIST desired outputs from numbers to unique vectors
% 0 -> 1 0 0 0 0 0 0 0 0 0
% 1 -> 0 1 0 0 0 0 0 0 0 0
% ...
% 8 -> 0 0 0 0 0 0 0 0 1 0
% 9 -> 0 0 0 0 0 0 0 0 0 1
function T_converted = convertOutput(T)
    outputs = length(T);
    T_converted = zeros(10, outputs);
    
    for output = 1:outputs
         T_converted(T(output) + 1, output) = 1;
    end
end