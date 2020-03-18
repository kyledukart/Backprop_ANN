function [] = graphMomentum(MSE,epochs,MSETest)
    % print results of testing neurons in hidden layer's learning rate
    figure
    x = 1:epochs;
    plot(x, MSE(1,:),'r',x, MSE(2,:),'g',x, MSE(3,:),'c',x, MSE(4,:),'b')
    %xticks(x)
    %yticks(y)
    xlabel('Number of Epochs')
    ylabel('Mean Squared Error')
    legend('0.3','0.5','0.7','0.9')
    title('Training Accuracy of Momentum Coefficients')
    
    figure
    x = [1,2,3,4];
    plot(x, MSETest(1,:),'r')
    xticks([1,2,3,4])
    xticklabels({'0.3','0.5','0.7','0.9'})
    %yticks(y)
    xlabel('Momentum Coefficient')
    ylabel('Mean Squared Error')
    title('Error Rate of Momentum Coefficients')
