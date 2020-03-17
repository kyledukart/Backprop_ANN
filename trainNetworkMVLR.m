% This function trains a two-layer network using backpropogation and
% returns the resulting weight and bias for each layer, as well as the mean
% square error after every epoch for every input (organized row=input,
% col=epoch, value=mse)

% P (matrix) is training set of inputs
% T (matrix) is training set of desired outputs
% neuronsPerLayer (vector) specifies amounts of neurons per layer
% startingLR (scalar) specifies initial rate of learning
% vlrThreshhold (scalar) percentage MSE change that determines LR (1-5%)
% vlrIncrease (scalar) coefficient by which to increase lr
% vlrDecrease (scalar) coefficient by which to decrease lr
% epochs (scalar) specifies amount of epochs
function [W1, B1, W2, B2, MSE, LR] = trainNetworkMVLR(P, T, neuronsPerLayer, startingLR, vlrThreshold, vlrIncrease, vlrDecrease, momentum, epochs)
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

    % Set initial learning rate. This will be modified based on the
    % preformance of the network per epoch
    LR = zeros(1, epochs);
    LR(1) = startingLR;
    
    for epoch = 1:epochs
        %% Perform backpropogation
        MSETemp = 0;
       
       % Keep track of original weights in epoch in case changes get discarded
       W2_original = W2;
       B2_original = B2;
       W1_original = W1;
       B1_original = B1;

       % Perform backpropogation for current epoch
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
           [W2, B2] = addMomentum(W2, -LR(epoch) * s2 * a1', B2, -LR(epoch) * s2, momentum);
           [W1, B1] = addMomentum(W1, -LR(epoch) * s1 * p', B1, -LR(epoch) * s1, momentum);

           % save error for graphing purposes
           MSETemp = MSETemp + meanSquaredError(t, a2);
       end

       % Calculate MSE for this epoch
       MSE(epoch) = MSETemp / inputs;

       %% Update learning rate, unless it is last epoch
       if (epoch < epochs)
           % Calculate percent change from previous epoch MSE (0 for first
           % epoch)
           PercentChange = 0;
           if (epoch > 1)
               PercentChange = (MSE(epoch) - MSE(epoch - 1)) / abs(MSE(epoch - 1)) * 100;
           end

           % If MSE increases, keep changes and don't change LR
           if (PercentChange > 0)
               % If MSE increases over threshhold, discard changes and decrease
               % LR
               if (PercentChange > vlrThreshold)
                   % Discard change
                   W2 = W2_original;
                   B2 = B2_original;
                   W1 = W1_original;
                   B1 = B1_original;

                   LR(epoch + 1) = LR(epoch) * vlrDecrease;
               else
                   % Otherwise keep same LR
                   LR(epoch + 1) = LR(epoch);
               end
           else
               % If MSE decreases, keep changes and increase LR
               LR(epoch + 1) = LR(epoch) * vlrIncrease;
           end
       end
    end