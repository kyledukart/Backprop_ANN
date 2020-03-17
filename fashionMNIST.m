function [] = fashionMNIST(S1, S2, learningRate, epochs)

%import the data
[trainData, finaltestData] = loadFashionData();

%split trainData into training and validation sets
testData = trainData(:,50000:end);
trainData = trainData(:,1:49999);

%pull out P and T from the input data
P = trainData(3:end,:);
T = convertOutput(trainData(2,:));
testP = testData(3:end,:);
testT = convertOutput(testData(2,:));

%normalize the data (Choose one method)
P = minMaxNormalization(P);
testP = minMaxNormalization(testP);
%P = zscore(P);
%testP = zscore(testP);

%train network
[W1, B1, W2, B2, MSETraining] = trainNetwork(P, T, [S1 S2], learningRate, epochs);  

% Graph the network learning speed 
graphFashionMSE(MSETraining);

%test network
MSE = testNetwork(testP, testT, W1, B1, W2, B2)