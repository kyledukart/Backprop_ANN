function [] = testFashionEpochs(S1, S2, LR)

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
for i = 1:20
    epochs = i * 10;
    [W1, B1, W2, B2, MSE] = trainNetwork(P, T, [S1 S2], LR, epochs);  
    
    % test the network with test data
    MSETest(i) = testNetwork(testP, testT, W1, B1, W2, B2);
end
graphEpochs(MSETest, epochs);