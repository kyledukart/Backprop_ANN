function [] = testFashionEpochs(S1, S2, LR)

% Import the data
[trainP, trainT, testP, testT] = loadFashionData();

% Normalize the data (Choose one method)
% trainP = minMaxNormalization(P);
% testP = minMaxNormalization(testP);
% P = zscore(P);
% testP = zscore(testP);

%train network
for i = 1:20
    epochs = i * 10;
    [W1, B1, W2, B2, MSE] = trainNetwork(trainP, trainT, [S1 S2], LR, epochs);  
    
    % test the network with test data
    MSETest(i) = testNetwork(testP, testT, W1, B1, W2, B2);
end

graphEpochs(MSETest, epochs);