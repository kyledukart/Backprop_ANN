function [] = testMVLRES(S1, S2, learningRate, vlrThreshold, vlrIncrease, vlrDecrease, momentum, epochs)

% Import the data
[trainP, trainT, testP, testT] = loadFashionData();

% Normalize the data (Choose one method)
trainP = minMaxNormalization(trainP);
testP = minMaxNormalization(testP);
% P = zscore(P);
% testP = zscore(testP);

validationSetSize = [100, 1000, 10000];

for counter = 1:length(validationSetSize)
    % Train the network
    [W1, B1, W2, B2, MSE, LRCurrent, VMSE] = trainNetworkMVLRES(trainP, trainT, [24 10], 0.01, 5, 1.3, 0.7, 0.9, validationSetSize(counter), 60);  
    MSETrain(counter,:) = MSE;
    VMSETrain(counter,:) = VMSE;
    LR(counter,:) = LRCurrent;
    
    % Test the network
    MSETest(counter) = testNetwork(testP, testT, W1, B1, W2, B2);
end

MSETrainC = MSETrain;
VMSETrainC = VMSETrain;
LRC = LR;
for counter = 1:3
    index = min((LastEpoch(counter)), 60);
    MSETrainC(counter, index:end) = min(MSETrainC(counter, 1:index));
    VMSETrainC(counter, index:end) = min(VMSETrainC(counter, 1:index));
    LRC(counter, index:end) = min(LRC(counter, 1:index));
end

graphMVLRES(MSETrainC, 60, MSETest, LRC, VMSETrainC);