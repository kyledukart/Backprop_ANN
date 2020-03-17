function [] = testMVLRES(S1, S2, learningRate, vlrThreshold, vlrIncrease, vlrDecrease, momentum, epochs)

% Import the data
[trainP, trainT, testP, testT] = loadFashionData();

% Normalize the data (Choose one method)
% trainP = minMaxNormalization(P);
% testP = minMaxNormalization(testP);
% P = zscore(P);
% testP = zscore(testP);

validationSetSize = [100, 500, 1000, 5000, 10000];

for counter = 1:length(vlrThreshold)
    % Train the network
    [W1, B1, W2, B2, MSE, LRCurrent, VMSE, LastEpochCurrent] = trainNetworkMVLRES(trainP, trainT, [S1 S2], learningRate, vlrThreshold, vlrIncrease, vlrDecrease, momentum, validationSetSize(counter), epochs);  
    MSETrain(counter,:) = MSE;
    VMSETrain(counter,:) = VMSE;
    LR(counter,:) = LRCurrent;
    LastEpoch(counter) = LastEpochCurrent;
    
    % Test the network
    MSETest(counter) = testNetwork(testP, testT, W1, B1, W2, B2);
end

graphMVLRES(MSETrain, epochs, MSETest, LR, VMSETrain, LastEpoch);