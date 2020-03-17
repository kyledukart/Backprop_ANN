function [] = testMomentum(S1, S2, learningRate, epochs)

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
counter = 0;
for momentum = [0.2, 0.5, 0.8, 0.9, 0.98]
    counter = counter + 1;
    [W1, B1, W2, B2, MSE] = trainNetwork(P, T, [S1 S2], LR, epochs);  
    MSETrain(counter,:) = MSE;
    
    % test the network with test data
    MSETest(counter) = testNetwork(testP, testT, W1, B1, W2, B2);
end
graphLearningRate(MSETrain,epochs,MSETest);