% This function trains a two-layer network using backpropogation and
% returns the resulting weight and bias for each layer, as well as the mean
% square error after every epoch for every input (organized row=input,
% col=epoch, value=mse)

% P (matrix) is training set of inputs
% T (matrix) is training set of desired outputs
% neuronsPerLayer (vector) specifies amounts of neurons per layer
% learningRate (scalar) specifies rate of learning
% momentum (scalar) value between 0 and 1 (higher = less impact per epoch)
% epochs (scalar) specifies amount of epochs
function [W1, B1, W2, B2, MSE] = trainNetworkM(P, T, neuronsPerLayer, learningRate, momentum, epochs)
    %% Initialize inputs/outputs
    layers = length(neuronsPerLayer);
    [inputLength, inputs] = size(P);

    % Initialize all important weights and biases, as well as average error
    % for every epoch
    W1 = randn(neuronsPerLayer(1), inputLength);
    B1 = randn(neuronsPerLayer(1), 1);
    W2 = randn(neuronsPerLayer(2), neuronsPerLayer(1));
    B2 = randn(neuronsPerLayer(2), 1);
    MSE = zeros(1,epochs);
    
    % Handle improper input
    if (epochs <= 0 || layers <= 0)
        return;
    end
    
    %% Perform backpropogation
    for epoch = 1:epochs
       MSETemp = 0;
       for input = 1:inputs
           p = P(:, input);
           t = T(:, input);
           
           % Propogate inputs forward through network
           [n1, a1] = neuronLayer(W1, p, B1);
           [n2, a2] = neuronLayer(W2, a1, B2);

           % Propogate sensitivities backward through network
           s2 = -2 * (t - a2) .* logsigdot(n2);
           s1 = logsigdot(n1) .* W2' * s2;
           
           % Update weights and biases with momentum
           [W2, B2] = addMomentum(W2, -learningRate * s2 * a1', B2, -learningRate * s2, momentum);
           [W1, B1] = addMomentum(W1, -learningRate * s1 * p', B1, -learningRate * s1, momentum);
           
           % save error for graphing purposes
           MSETemp = MSETemp + meanSquaredError(t, a2);
       end
       MSE(epoch) = MSETemp / inputs;
    end