function [] = testLearningRate(S1, S2, epochs)

% load the MNIST data
data = load('mnist.mat');
P = double(data.trainX)';
T = convertOutput(double(data.trainY));
testP = double(data.testX)';
testT = convertOutput(double(data.testY));

counter = 0;
for learningRate = [1/200,1/400,1/800,1/1600,1/3200]
    % train the network with given parameters
    counter = counter + 1;
    [W1, B1, W2, B2, MSE] = trainNetwork(P, T, [S1 S2], learningRate, epochs);
    MSETrain(counter,:) = MSE;
    
    % test the network with test data
    MSETest(counter) = testNetwork(testP, testT, W1, B1, W2, B2);
end
graphLearningRate(MSETrain,epochs,MSETest);