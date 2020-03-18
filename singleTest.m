function [] = singleTest(trainP, trainT, testP, testT, S1, S2, learningRate, epochs)

% Import the data
[trainP, trainT, testP, testT] = loadFashionData();

% Normalize the data (Choose one method)
 trainP = minMaxNormalization(trainP);
 testP = minMaxNormalization(testP);
% P = zscore(P);
% testP = zscore(testP);

[W1, B1, W2, B2, MSE] = trainNetwork(trainP, trainT, [S1 S2], learningRate, epochs);  

figure
x = 1:epochs;
plot(x, MSE,'r')
%xticks(x)
%yticks(y)
xlabel('Number of Epochs')
ylabel('Mean Squared Error')
title('Training Error')