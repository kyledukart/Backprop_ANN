function [] = testFashionLearningRate(S1, S2, epochs)

% Import the data
[trainP, trainT, testP, testT] = loadFashionData();

% Normalize the data (Choose one method)
% trainP = minMaxNormalization(P);
% testP = minMaxNormalization(testP);
% P = zscore(P);
% testP = zscore(testP);

LR = [1/20,1/50,1/100,1/200,1/500];

for counter = 1:length(LR)
    % Train the network
    [W1, B1, W2, B2, MSE] = trainNetwork(trainP, trainT, [S1 S2], LR(counter), epochs);  
    MSETrain(counter,:) = MSE;
    
    % Test the network
    MSETest(counter) = testNetwork(testP, testT, W1, B1, W2, B2);
end

graphLearningRate(MSETrain,epochs,MSETest);