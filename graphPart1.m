function output = graphPart1(MSE)
    % print results matrix as graph
    x = 1:length(MSE);
    %y = [0,.1,.2,.3,.4,.5,.6,.7,.8,.9,1.0];
    figure
    plot(x, MSE(1,:),'r',x,MSE(2,:),'g',x,MSE(3,:),'b')
    %xticks(x)
    %yticks(y)
    xlabel('Number of Epochs')
    ylabel('Mean Squared Error')
    legend('Classify 0', 'Classify 1', 'Classify 2')
    title('ANN Backprop Number Recognition')