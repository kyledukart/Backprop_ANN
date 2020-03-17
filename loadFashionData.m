function [trainP, trainT, testP, testT] = loadFashionData()

train = table2array(readtable("train.csv"));
%test = table2array(readtable("test.csv"));

train = train';

%split trainData into training and validation sets
testData = train(:,50000:end);
trainData = train(:,1:49999);

%pull out P and T from the input data
trainP = trainData(3:end,:);
trainT = convertOutput(trainData(2,:));
testP = testData(3:end,:);
testT = convertOutput(testData(2,:));