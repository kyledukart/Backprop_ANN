function [] = graphPart1(MSE1, MSE2, MSE3)
    % print results matrix as graph
    figure
    x = 1:length(MSE1);
    plot(x, MSE1(1,:),'r',x,MSE2(1,:),'g',x,MSE3(1,:),'b')
    %xticks(x)
    %yticks(y)
    xlabel('Number of Epochs')
    ylabel('Mean Squared Error')
    legend('0 Errors', '4 Errors', '8 Errors')
    title('ANN Backprop Number Recognition')