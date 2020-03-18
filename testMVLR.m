function [] = testMVLR(S1, S2, learningRate, momentum, epochs)

% Import the data
[trainP, trainT, testP, testT] = loadFashionData();

% Normalize the data (Choose one method)
trainP = minMaxNormalization(trainP);
testP = minMaxNormalization(testP);
% P = zscore(P);
% testP = zscore(testP);

vlrThreshold = 5;
vlrIncrease = [1.5, 1.3, 1.1];
vlrDecrease = [0.5, 0.7, 0.9];

for counter = 1:length(vlrIncrease)
    % Train the network
    [W1, B1, W2, B2, MSE, LRCurrent] = trainNetworkMVLR(trainP, trainT, [24 10], 0.01, vlrThreshold, vlrIncrease(counter), vlrDecrease(counter), 0.9, 60);  
    MSETrain(counter,:) = MSE;
    LR(counter,:) = LRCurrent;
    
    % Test the network
    MSETest(counter) = testNetwork(testP, testT, W1, B1, W2, B2);
end

graphMVLR(MSETrain,60,MSETest, LR);