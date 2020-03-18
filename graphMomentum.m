function [] = graphMomentum(MSE,epochs,MSETest)
    % print results of testing neurons in hidden layer's learning rate
    figure
    x = 1:epochs;
    plot(x, MSE(1,:),'r',x, MSE(2,:),'g',x, MSE(3,:),'c',x, MSE(4,:),'b',x, MSE(5,:),'m')
    %xticks(x)
    %yticks(y)
    xlabel('Number of Epochs')
    ylabel('Mean Squared Error')
    legend('0.2','0.5','0.8','0.9','0.98')
    title('Training Speed of Variable Momentum Coefficients')
    
    figure
    x = [1,2,3,4,5];
    plot(x, MSETest(1,:),'r')
    xticks([1,2,3,4,5])
    xticklabels({'0.2','0.5','0.8','0.9','0.98'})
    %yticks(y)
    xlabel('Momentum Coefficient')
    ylabel('Mean Squared Error')
    title('Error Rate of Different Momentum Coefficients')