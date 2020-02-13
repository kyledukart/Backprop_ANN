% function to implement a layer of neurons
function [n,a] = neuronLayer(p, w, b)

n = p * w' + b;
a = logsig(n);