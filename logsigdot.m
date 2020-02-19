% function to find the derivative of the logsig function
function output = logsigdot(n)

for i = 1:length(n)
output(i,1) = (logsig(n(i))) * (1 - logsig(n(i)));
end