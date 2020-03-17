function [train,test] = loadFashionData()

train = readtable("train.csv");
test = readtable("test.csv");