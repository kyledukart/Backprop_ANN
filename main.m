% main function for neural network with backpropagation
function output = main(S1, S2, learningRate, epochs)

% get input patterns
P = inputPatterns();  % input P is a 3 x 30 matrix
T = [1,0,0;0,1,0;0,0,1];   % t is the given answers matrix, with a size of S2 x 3

[W1, B1, W2, B2, MSE1] = trainNetwork(P, T, [S1 S2], learningRate, epochs);

W1
B1
W2
B2

P = addNoise(inputPatterns(),4);

[W1, B1, W2, B2, MSE2] = trainNetwork(P, T, [S1 S2], learningRate, epochs);
W1
B1
W2
B2

P = addNoise(inputPatterns(),8);

[W1, B1, W2, B2, MSE3] = trainNetwork(P, T, [S1 S2], learningRate, epochs);
W1
B1
W2
B2

graphPart1(MSE1, MSE2, MSE3);