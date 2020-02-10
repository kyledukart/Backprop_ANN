% function to implement a layer of neurons
function output = neuronLayer(p, w, b)

output = logsig(p * w' + b);