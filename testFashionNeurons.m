function [] = testFashionNeurons(S2, LR, epochs)

% Import the data
[trainP, trainT, testP, testT] = loadFashionData();

% Normalize the data (Choose one method)
trainP = minMaxNormalization(trainP);
testP = minMaxNormalization(testP);
% P = zscore(P);
% testP = zscore(testP);

%train network
for i = 1:10
    S1 = i * 4;
    [W1, B1, W2, B2, MSE] = trainNetwork(trainP, trainT, [S1 S2], LR,  epochs);  
    
    % test the network with test data
    MSETest(i) = testNetwork(testP, testT, W1, B1, W2, B2);
end

graphNeurons(MSETest, epochs);