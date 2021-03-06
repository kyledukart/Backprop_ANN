% Returns mean squared error for running given input P against the trained
% two-layer network and comparing it to desired output T
function MSE = testNetwork(P, T, W1, B1, W2, B2)
    [inputLength, inputs] = size(P);
    MSE = 0;
    
    % Run every input through network
    for input = 1:inputs
        p = P(:, input);
        t = T(:, input);
        
        [n1, a1] = neuronLayer(W1, p, B1);
        [n2, a2] = neuronLayer(W2, a1, B2);
        
        % Sum up MSE for every input
        MSE = MSE + meanSquaredError(t, a2);
    end
    
    % Take average MSE for all inputs
    MSE = MSE / inputs;
    
    
    
    