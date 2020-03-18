function [] = graphMVLR(MSE, epochs, MSETest, LR)
    % print results of testing neurons in hidden layer's learning rate
    figure
    x = 1:epochs;
    plot(x, MSE(1,:),'r',x, MSE(2,:),'g',x, MSE(3,:),'c',x, MSE(4,:),'b',x, MSE(5,:),'m')
    %xticks(x)
    %yticks(y)
    xlabel('Number of Epochs')
    ylabel('Mean Squared Error')
    legend('1','2','3','4','5')
    title('Mean Squared Error of Variable Learning Rate Percentage Threshold')
    
    figure
    x = [1,2,3,4,5];
    plot(x, MSETest(1,:),'r')
    xticks([1,2,3,4,5])
    xticklabels({'1','2','3','4','5'})
    %yticks(y)
    xlabel('Variable Learning Rate Percentage Threshold')
    ylabel('Mean Squared Error')
    title('Error Rate of Different Variable Learning Rate Percentage Thresholds')
    
    figure
    x = 1:epochs;
    plot(x, LR(1,:),'r',x, LR(2,:),'g',x, LR(3,:),'c',x, LR(4,:),'b',x, LR(5,:),'m')
    %xticks(x)
    %yticks(y)
    xlabel('Number of Epochs')
    ylabel('Learning Rate')
    legend('1','2','3','4','5')
    title('Learning Rate Resulting from Variable Learning Rate Percentage Threshold')
