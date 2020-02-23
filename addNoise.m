% Takes input matrix where every column is one input, and adds required
% amount of random noise to each input
function P = addNoise(P, noise)
    if noise == 0    
        return;
    end
    
    % Get number of inputs and length of each input
    [inputLength, inputs] = size(P);
    
    % For each input, pick random noise pixels and flip them
    for input = 1:inputs
        inds = randperm(inputLength);
        P(inds(1:noise), input) = -P(inds(1:noise), input);
    end