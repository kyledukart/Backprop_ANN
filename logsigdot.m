% function to find the derivative of the logsig function
function output = logsigdot(n)

output = (logsig(n)) * (1 - logsig(n));