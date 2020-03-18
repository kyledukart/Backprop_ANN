function [] = graphMVLRES(MSE, epochs, MSETest, LR, VMSE, LastEpoch)
    % print results of testing neurons in hidden layer's learning rate
    figure
    x = 1:epochs;
    plot(x, MSE(1,1:LastEpoch(1)),'r',x, MSE(2,1:LastEpoch(2)),'g',x, MSE(3,1:LastEpoch(3)),'c',x, MSE(4,1:LastEpoch(4)),'b',x, MSE(5,1:LastEpoch(5)),'m')
    %xticks(x)
    %yticks(y)
    xlabel('Number of Epochs')
    ylabel('Mean Squared Error')
    legend('100','500','1000','5000','10000')
    title('Mean Squared Error of Variable Validation Set Size for Early Stopping')
    
    figure
    x = 1:epochs;
    plot(x, VMSE(1,1:LastEpoch(1)),'r',x, VMSE(2,1:LastEpoch(2)),'g',x, VMSE(3,1:LastEpoch(3)),'c',x, VMSE(4,1:LastEpoch(4)),'b',x, VMSE(5,1:LastEpoch(5)),'m')
    %xticks(x)
    %yticks(y)
    xlabel('Number of Epochs')
    ylabel('Mean Squared Error during Validation')
    legend('100','500','1000','5000','10000')
    title('Mean Squared Error during Validation of Variable Validation Set Size for Early Stopping')
    
    figure
    x = [1,2,3,4,5];
    plot(x, MSETest(1,:),'r')
    xticks([1,2,3,4,5])
    xticklabels({'100','500','1000','5000','10000'})
    %yticks(y)
    xlabel('Validation Set Size')
    ylabel('Mean Squared Error')
    title('Accuracy of Different Validation Set Sizes for Early Stopping')
    
    figure
    x = 1:epochs;
    plot(x, LR(1,1:LastEpoch(1)),'r',x, LR(2,1:LastEpoch(2)),'g',x, LR(3,1:LastEpoch(3)),'c',x, LR(4,1:LastEpoch(4)),'b',x, LR(5,1:LastEpoch(5)),'m')
    %xticks(x)
    %yticks(y)
    xlabel('Number of Epochs')
    ylabel('Learning Rate')
    legend('100','500','1000','5000','10000')
    title('Learning Rate Resulting from Variable Validation Set Sizes for Early Stopping')
    
    
