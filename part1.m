function MSEAverage = part1(neuronsPerLayer, learningRate, epochs)
    %% Initialize output and network
    % Get noise-free input patterns and target outputs
    [P, T] = inputPatterns();
    [inputLength, inputs] = size(P);
    [outputLength, outputs] = size(T);
    
    % Initialize MSE matrix
    MSETotal = zeros(10, 3);
    
    % Train network with regular patterns
    [W1, B1, W2, B2, MSETraining] = trainNetwork(P, T, neuronsPerLayer, learningRate, epochs);
    
    % Graph the network learning speed 
    graphPart2(MSETraining);
    
    %% Test network with noisy patterns
    % Add noise to patterns and run against network 10 times
    P_0 = addNoise(P, 0); % 0 bits of noise
    for i = 1:10
        MSETotal(i, 1) = testNetwork(P_0, T, W1, B1, W2, B2);
    end
    
    P_4 = addNoise(P, 4); % 4 bits of noise
    for i = 1:10
        MSETotal(i, 2) = testNetwork(P_4, T, W1, B1, W2, B2);
    end
    
    P_8 = addNoise(P, 8); % 8 bits of noise
    for i = 1:10
        MSETotal(i, 3) = testNetwork(P_8, T, W1, B1, W2, B2);
    end
    
    % Take average MSE for noise pattern
    MSEAverage = mean(MSETotal);
    
    %% Graph mean squared errors from testing network with noisy patterns
    figure
    x = (0:length(MSEAverage)-1) .* 4;
    plot(x, MSEAverage,'r')
    %xticks(x)
    %yticks(y)
    xlabel('Noise (# of bits)')
    ylabel('Mean Squared Error')
    title('MSE of Network vs. Noise of Inputs')