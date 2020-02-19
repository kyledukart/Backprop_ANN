% function to implement a layer of neurons
function [n,a] = neuronLayer(w, p, b)
n = w * p + b;
a = logsig(n);