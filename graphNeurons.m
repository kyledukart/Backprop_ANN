function [] = graphNeurons(MSE,epochs)
    % print results of testing neurons in hidden layer's learning rate
    figure
    x = 1:length(MSE)
    MSE
    plot(x, MSE)
    %xticks(x)
    xticklabels({'4','8','12','16','20','24','28','32','36','40'})
    %yticks(y)
    xlabel('Number of Hidden Neurons')
    ylabel('Mean Squared Error')
    title('Accuracy of Different Numbers of Hidden Neurons')