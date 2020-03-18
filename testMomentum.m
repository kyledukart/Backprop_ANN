function [] = testMomentum(S1, S2, learningRate, epochs)

% Import the data
[trainP, trainT, testP, testT] = loadFashionData();

% Normalize the data (Choose one method)
% trainP = minMaxNormalization(P);
% testP = minMaxNormalization(testP);
% P = zscore(P);
% testP = zscore(testP);

momentum = [0.2, 0.5, 0.8, 0.9, 0.98];

for counter = 1:length(momentum)
    % Train the network
    [W1, B1, W2, B2, MSE] = trainNetworkM(trainP, trainT, [S1 S2], learningRate, momentum(counter), epochs);  
    MSETrain(counter,:) = MSE;
    
    % Test the network
    MSETest(counter) = testNetwork(testP, testT, W1, B1, W2, B2);
end

graphMomentum(MSETrain,epochs,MSETest);