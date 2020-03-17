function [] = graphPart2(MSE)
    % print results matrix as graph
    figure
    x = 1:length(MSE);
    plot(x, MSE(1,:),'r')
    %xticks(x)
    %yticks(y)
    xlabel('Number of Epochs')
    ylabel('Mean Squared Error')
    %legend('0 Errors', '4 Errors', '8 Errors')
    title('ANN Backprop Number Recognition')