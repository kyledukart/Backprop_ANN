function [] = fashionMNIST(S1, S2, learningRate, epochs)

%import the data
[trainData, finaltestData] = loadFashionData();

%split trainData into training and validation sets
testData = trainData(:,50000:end);
trainData = trainData(:,1:49999);

%pull out P and T from the input data
P = trainData(3:end,:);
T = convertOutput(trainData(2,:));

%normalize the data (Choose one method)
P = minMaxNormalization(P);
%P = zscore(P);

%train network
[W1, B1, W2, B2, MSETraining] = trainNetwork(P, T, [S1 S2], learningRate, epochs);  

% Graph the network learning speed 
graphFashionMSE(MSETraining);

%test network
testP = testData(3:end,:);
%normalization (Choose one method, same as above)
testP = minMaxNormalization(testP);
%testP = zscore(testP);

testT = convertOutput(testData(2,:));
MSE = testNetwork(testP, testT, W1, B1, W2, B2)