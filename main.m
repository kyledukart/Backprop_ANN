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
[train, test] = loadFashionData();

%normalize the data

%train network
P = train(:,3:end)
T = train(:,2);
%[W1, B1, W2, B2, MSETraining] = trainNetwork(P, T, [S1 S2], learningRate, epochs);  
% Graph the network learning speed 
%graphPart2(MSETraining);

%test network