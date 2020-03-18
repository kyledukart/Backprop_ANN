function [] = singleTest()
[trainP, trainT, testP, testT] = loadFashionData();

% Normalize the data (Choose one method)
 trainP = minMaxNormalization(trainP);
 testP = minMaxNormalization(testP);
% P = zscore(P);
% testP = zscore(testP);

[W1, B1, W2, B2, MSE, LR, VMSE] = trainNetworkMVLRES(trainP, trainT, [24 10], 0.01, 5, 1.3, 0.5, 0.9, 10000, 60);  

figure
x = 1:60;
plot(x, MSE,'r')
%xticks(x)
%yticks(y)
xlabel('Number of Epochs')
ylabel('Mean Squared Error')
title('Training Error')

figure
x = 1:60;
plot(x, VMSE,'r')
%xticks(x)
%yticks(y)
xlabel('Number of Epochs')
ylabel('Validation Mean Squared Error')
title('Validation Training Error')

figure
x = 1:epochs;
plot(x, LR,'r')
%xticks(x)
%yticks(y)
xlabel('Number of Epochs')
ylabel('Learning Rate')
title('Learning Rate')

 MSE = testNetwork(testP, testT, W1, B1, W2, B2);