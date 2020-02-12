% main function for neural network with backpropagation
function output = main(X)

% get input patterns
P = inputPatterns();  % input P is a 30 x 3 matrix

%% set up two layers of neurons, first layer has X neurons, second layer has 3 neurons
% initialize perceptron layer 1 with X neurons
% initialize perceptron layer 2 with 3 neurons
% set initial weights and biases
B1 = zeros(X,1);  % B1 is biases for layer 1, with a size of X x 1
W1 = zeros(X,30);  % W1 is weight matrix for layer 1, with a size of X x 30
B2 = zeros(3,1);  % B2 is biases for layer 2, with a size of 3 x 1
W2 = 0;  % W2 is a weight matrix for layer 2, with a size of 3 x X
% set answers
t = [1,0,0;0,1,0;0,0,1];   % t is the given answers matrix, with a size of 3 x 3

%% forward compute
a1 = neuronLayer(P,W1,B1);  % a1 is the results of layer 1, with a size of X x 1
a2 = neuronLayer(n1,W2,B2);  % a2 is the results of computation, with a size of 3 x 1

%% backpropagation
% compute error
e = t - a2;
% update W2 and B2
% update W1 and B1

%% graph output


%% testing
% randomly change 0, 4, and 8 pixels

% "you might want to accumulate total squared error during each training
% epoch, then take the mean at the end of each epoch to produce a plot of 
% mean squared error (MSE) versus training epoch"