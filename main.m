% main function for neural network with backpropagation
function output = main(X)

% get input patterns
P = inputPatterns();

%% set up two layers of neurons, first layer has X neurons, second layer has 3 neurons
% perceptron layer 1
% perceptron layer 2
% set initial weights and biases
B1 = 0;
W1 = 0;
B2 = 0;
W2 = 0;
% set answers
t = 0;

%% forward compute
n1 = neuronLayer(P,W1,B1);
n2 = neuronLayer(n1,W2,B2);

%% backpropagation
% compute error
e = t - n2;
% update W2 and B2
% update W1 and B1

%% graph output


%% testing
% randomly change 0, 4, and 8 pixels

% "you might want to accumulate total squared error during each training
% epoch, then take the mean at the end of each epoch to produce a plot of 
% mean squared error (MSE) versus training epoch"