% main function for neural network with backpropagation
function output = main(S1, S2, learningRate, epochs)

%% Part 1
part1([S1 S2], learningRate, epochs);

%% Part 2

% load the MNIST data
data = load('mnist.mat');
P = double(data.trainX);
T = double(data.trainY);

% train the network with given parameters
[W1, B1, W2, B2, MSE] = trainNetwork(P, T, [5 1], learningRate, epochs);

figure
graphPart2(MSE);
