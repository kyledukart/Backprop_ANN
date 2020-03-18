function [] = testMVLR(S1, S2, learningRate, momentum, epochs)

% Import the data
[trainP, trainT, testP, testT] = loadFashionData();

% Normalize the data (Choose one method)
% trainP = minMaxNormalization(P);
% testP = minMaxNormalization(testP);
% P = zscore(P);
% testP = zscore(testP);

vlrThreshold = [1, 2, 3, 4, 5];
vlrIncrease = 2;
vlrDecrease = 0.7;

for counter = 1:length(vlrThreshold)
    % Train the network
    [W1, B1, W2, B2, MSE, LRCurrent] = trainNetworkMVLR(trainP, trainT, [S1 S2], learningRate, vlrThreshold(counter), vlrIncrease, vlrDecrease, momentum, epochs);  
    MSETrain(counter,:) = MSE;
    LR(counter,:) = LRCurrent;
    
    % Test the network
    MSETest(counter) = testNetwork(testP, testT, W1, B1, W2, B2);
end

graphMVLR(MSETrain,epochs,MSETest, LR);