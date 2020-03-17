function [] = graphLearningRate(MSE,epochs,MSETest)
    % print results of testing neurons in hidden layer's learning rate
    figure
    x = 1:epochs;
    plot(x, MSE(1,:),'r',x, MSE(2,:),'g',x, MSE(3,:),'c',x, MSE(4,:),'b',x, MSE(5,:),'m')
    %xticks(x)
    %yticks(y)
    xlabel('Number of Epochs')
    ylabel('Mean Squared Error')
    legend('1/10','1/20','1/50','1/100','1/200')
    title('Training Speed with different Learning Rates')
    
    figure
    x = [1,2,3,4,5];
    plot(x, MSETest(1,:),'r')
    %xticks([1/10,1/20,1/50,1/100,1/200])
    %yticks(y)
    xlabel('Learning Rate')
    ylabel('Mean Squared Error')
    title('Accuracy of different Learning Rates')