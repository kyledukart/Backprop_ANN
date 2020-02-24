function [] = graphTestLayers(MSE,epochs,MSETest)
    % print results of testing neurons in hidden layer's learning rate
    figure
    x = 1:epochs;
    plot(x, MSE(1,:),'r',x, MSE(2,:),'g',x, MSE(3,:),'c',x, MSE(4,:),'b',x, MSE(5,:),'m')
    %xticks(x)
    %yticks(y)
    xlabel('Number of Epochs')
    ylabel('Mean Squared Error')
    legend('2 Hidden Neurons','4 Hidden Neurons','6 Hidden Neurons','8 Hidden Neurons','10 Hidden Neurons')
    title('Training Speed of Hidden Neurons')
    
    figure
    x = [2,4,6,8,10];
    plot(x, MSETest(1,:),'r')
    xticks(x)
    %yticks(y)
    xlabel('Number of Hidden Neurons')
    ylabel('Mean Squared Error')
    title('Accuracy of Hidden Neurons')