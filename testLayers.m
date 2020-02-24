function [] = testLayers(S2, learningRate, epochs)

% load the MNIST data
data = load('mnist.mat');
P = double(data.trainX)';
T = convertOutput(double(data.trainY));
testP = double(data.testX)';
testT = convertOutput(double(data.testY));

for hiddenLayers = [2,4,6,8,10]
    % train the network with given parameters
    [W1, B1, W2, B2, MSE] = trainNetwork(P, T, [hiddenLayers S2], learningRate, epochs);
    MSETrain(hiddenLayers/2,:) = MSE;
    
    % test the network with test data
    MSETest(hiddenLayers/2) = testNetwork(testP, testT, W1, B1, W2, B2);
end
graphTestLayers(MSETrain,epochs,MSETest);