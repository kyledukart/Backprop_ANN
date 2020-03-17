% main function for neural network with backpropagation
function output = main(S1, S2, learningRate, epochs)

%% Part 1
%part1([S1 S2], learningRate, epochs);

%% Part 2
%part2(S1, S2, learningRate, epochs);
%testLayers(S2, learningRate, epochs);
%testLearningRate(S1, S2, epochs);

%% Fashion MNIST
%import the data
[trainData, finaltestData] = loadFashionData();
%trainData = load('FashionTrainData.mat');
%testData = load('FashionTestData.mat');

%split trainData into training and validation sets
testData = trainData(:,50000:end);
trainData = trainData(:,1:49999);
%normalize the data

%train network
P = trainData(3:end,:);
P = P .* 1/256;
T = convertOutput(trainData(2,:));
[W1, B1, W2, B2, MSETraining] = trainNetwork(P, T, [S1 S2], learningRate, epochs);  
% Graph the network learning speed 
graphPart2(MSETraining);

%test network
testP = testData(3:end,:);
P = P .* 1/256;
testT = convertOutput(testData(2,:));
MSE = testNetwork(testP, testT, W1, B1, W2, B2);
graphPart2(MSE);