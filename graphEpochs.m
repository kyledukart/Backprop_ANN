function [] = graphEpochs(MSETest, epochs)
    figure
    x = 1:length(MSETest);
    plot(x, MSETest(1,:),'r')
    %xticks([1,2,3,4,5])
    %xticklabels({'1/20','1/50','1/100','1/200','1/500'})
    %yticks(y)
    xlabel('Number of Epochs')
    ylabel('Mean Squared Error')
    title('Accuracy of Different Numbers of Epochs')