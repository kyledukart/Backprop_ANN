function [train,test] = loadFashionData()

train = table2array(readtable("train.csv"));
test = table2array(readtable("test.csv"));

train = train';
test = test';
%save FashionTrainData.mat train;
%save FashionTestData.mat test;