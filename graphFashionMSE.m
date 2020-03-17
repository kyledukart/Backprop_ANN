function [] = graphFashionMSE(MSE)
    % print results matrix as graph
    figure
    x = 1:length(MSE);
    plot(x, MSE(1,:),'r')
    %xticks(x)
    %yticks(y)
    xlabel('Number of Epochs')
    ylabel('Mean Squared Error')
    title('ANN Fashion Recognition Learning Speed')