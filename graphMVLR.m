function [] = graphMVLR(MSE, epochs, MSETest, LR)
    % print results of testing neurons in hidden layer's learning rate
    figure
    x = 1:epochs;
    plot(x, MSE(1,:),'r',x, MSE(2,:),'g',x, MSE(3,:),'c')
    %xticks(x)
    %yticks(y)
    xlabel('Number of Epochs')
    ylabel('Mean Squared Error')
    legend('INC:1.5 DEC:0.5','INC:1.3 DEC:0.7','INC:1.1 DEC:0.9')
    title('Mean Squared Error of Variable Learning Rate Algorithm')
    
    figure
    x = [1,2,3];
    plot(x, MSETest(1,:),'r')
    xticks([1,2,3])
    xticklabels({'INC:1.5 DEC:0.5','INC:1.3 DEC:0.7','INC:1.1 DEC:0.9'})
    %yticks(y)
    xlabel('Learning Rate Increase')
    ylabel('Mean Squared Error')
    title('Error Rate of Variable Learning Rate Algorithm')
    
    figure
    x = 1:epochs;
    plot(x, LR(1,:),'r',x, LR(2,:),'g',x, LR(3,:),'c')
    %xticks(x)
    %yticks(y)
    xlabel('Number of Epochs')
    ylabel('Learning Rate')
    legend('INC:1.5 DEC:0.5','INC:1.3 DEC:0.7','INC:1.1 DEC:0.9')
    title('Learning Rate from Variable Learning Rate Algorithm')
