% main function for neural network with backpropagation
function output = main(S1, S2, learningRate, epochs)

% get input patterns
P = inputPatterns();  % input P is a 3 x 30 matrix
R = 30; % R is the number of dimensions in each input

%% set up two layers of neurons, first layer has S1 neurons, second layer has S2 neurons
% initialize perceptron layer 1 with S1 neurons
% initialize perceptron layer 2 with S2 neurons
% set initial weights and biases
B1 = zeros(S1,1);  % B1 is biases for layer 1, with a size of S1 x 1
W1 = zeros(S1,R);  % W1 is weight matrix for layer 1, with a size of S1 x R
B2 = zeros(S2,1);  % B2 is biases for layer 2, with a size of S2 x 1
W2 = zeros(S2,S1);  % W2 is a weight matrix for layer 2, with a size of S2 x S1
% set answers
t = [1,0,0;0,1,0;0,0,1];   % t is the given answers matrix, with a size of S2 x 3

%% loop for each epoch
for j = 1:epochs

    %% loop for each input in P (1 epoch)
    for i = 1:3
        %% forward compute
        [n1,a1] = neuronLayer(W1,P(:,i),B1);  % a1 is the results of layer 1, with a size of S1 x 1
        [n2,a2] = neuronLayer(W2,a1,B2);  % a2 is the results of computation, with a size of S2 x 1

        %% backpropagation
        % compute output layer sensitivities
        s2 = -2 * (t(:,i) - a2) .* logsigdot(n2);

        % propogate sensitivities backwards
        s1 = logsigdot(n1) .* W2' * s2; % TODO problems here, questionable transpose and dot product

        % update W2 and B2
        W2 = W2 - learningRate * s2 * a1';
        B2 = B2 - learningRate * s2;

        % update W1 and B1
        W1 = W1 - learningRate * s1 * P(:,i)';
        B1 = B1 - learningRate * s1;

    end  % end loop through input values i (1 epoch)
    
    % save percent error each epoch for graphing purposes
end  % end loop through epochs (j)
%% graph output


%% testing
% randomly change 0, 4, and 8 pixels

% "you might want to accumulate total squared error during each training
% epoch, then take the mean at the end of each epoch to produce a plot of 
% mean squared error (MSE) versus training epoch"