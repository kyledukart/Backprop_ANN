# Backprop_ANN
Backpropagation group assignment for CSS 485


Assignment Details:

Part 1: Simple Character Recognition
As a warm-up, you are asked to solve the same kind of pattern recognition problem as in textbook exercise E7.11, which you previously worked on using Hebbian learning. This time you will be using a multilayer ANN, trained using the backpropagation algorithm as a pattern classifier, rather than an autoassociator. To review, the input patterns are:

Input patterns for "0", "1", and "2" are in the file patterns.png

To solve this problem, use a network with two layers of neurons, with every neuron's transfer function being a log sigmoid. As discussed in class, this is often referred to as a three-layer network, because many people count the inputs as a separate layer (since the number of inputs and outputs is fixed by the problem, but the number of neurons in the first layer isn't). The first layer of neurons is generally called a hidden layer, since it (and its weights) are not directly constrained by the problem.

Your network should have three outputs, with each corresponding to one of the three characters. In other words, the outputs for the three patterns should be:

LaTeX: \mathbf{t}_0 = \left[\begin{array}{c}1 \\ 0 \\ 0\end{array}\right] \quad
\mathbf{t}_1 = \left[\begin{array}{c}0 \\ 1 \\ 0\end{array}\right] \quad
\mathbf{t}_2 = \left[\begin{array}{c}0 \\ 0 \\ 1\end{array}\right]t 0 = [ 1 0 0 ] t 1 = [ 0 1 0 ] t 2 = [ 0 0 1 ]

You will likely need to experiment with the number of hidden units to find how many are needed to produce good performance without overfitting.

Write code to implement the forward computation of such a network and the error backpropagation and weight update of backpropagation learning. I leave it up to you to test your code for smaller networks and simpler problems, such as those already solved in the textbook. I urge you to apply everything you've learned about software development to this task; in other words, if you try to just hack it out, you should know by now that it likely will never work. Verify the operation of the network for "clean" input. Make sure your report demonstrates that it works and includes the final weights and biases.

Next, investigate the network's ability to correctly classify damaged patterns just as you did for exercise E7.11, except this time randomly change 0, 4, and 8 pixels. Go through the same procedure as for E7.11 and produce the same kind of graph. Note that in this case, you are just using (and classifying) the three input patterns above.

Note that you may need to perform learning more than once from different sets of initial weights to achieve good performance (find a more-or-less global error minimum). To track learning algorithm status during training, you might want to accumulate total squared error during each training epoch, then take the mean at the end of each epoch to produce a plot of mean squared error (MSE) versus training epoch. You might also consider training with some noisy patterns in the training set to see if that helps generalization. However, this is just a warm-up, so your goal here is primarily to verify correct operation of your backprop network, learning rule, and training code, and to make sure that it has sufficient flexibility to accommodate the experimentation and changes you need to make during the process of building a functioning learning model. Hopefully, your code will be general-purpose enough that you can, for the most part, just re-use it for part 2. Please still include your warm-up work in your report.

Part 2: Handwriting Recognition With the MNIST Database
At this point, you should pretty much have all of the tools necessary to make a respectable show of tackling a real-world problem. This means a problem where the data, in terms of both size and cruftiness, is reasonably substantial. So, let's take a crack at the MNIST database, a database of handwritten digits that was originally collected by the National Institute of Standards and Technology and is commonly used to evaluate image processing and machine learning algorithms. Rather than spend a lot of time describing this dataset, please go to its canonical home page. There, you can find a complete description, download links, and the results of others' work on this dataset, with links to their papers providing "full" descriptions of what they did. One of the advantages of using such a standard dataset is that there is also code already written to do such things as read the data into Matlab, such as from this wiki page at Stanford.

Requirements
You have some latitude in deciding exactly what you will do to satisfy the assignment requirements. What you must do is:

Write all non-trivial code to implement your ANN and its learning algorithms. If you wrote generalizable code for part 1, this should be pretty easy.
Use a multi-layer network with backprop.
Explore at least one aspect of this ANN architecture or learning algorithm, assessing the relationship between this aspect and the learning process and/or the resultant network's performance on the test set. For example, you could explore modifications of the learning rule and their effects on training speed (batching/mini-batches, momentum, early stopping). Or you could investigate the effects of network hyperparameters, such as using softmax output (and the resultant changes to backprop), changing the size and number of layers, etc. on classification accuracy.
Relate what you have done to what you've learned in this class.
You should consider this an opportunity to really dig in to some part of the design and training of ANNs. Since this is a very well-used data set, you can easily tell how well your ANN does compared to many in the literature.
