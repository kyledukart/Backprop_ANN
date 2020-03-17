function [] = part2(S1, S2, learningRate, epochs)

% load the MNIST data
data = load('mnist.mat');
P = double(data.trainX)';
T = convertOutput(double(data.trainY));
testP = double(data.testX)';
testT = convertOutput(double(data.testY));

% train the network with given parameters
[W1, B1, W2, B2, MSE] = trainNetwork(P, T, [S1 S2], learningRate, epochs);

% graph the MSE per epoch
graphPart2(MSE);

% test the network with test data
MSE = testNetwork(testP, testT, W1, B1, W2, B2)

