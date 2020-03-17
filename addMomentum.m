function [W, B] = addMomentum(W_prev, W_update, B_prev, B_update, momentumCoeff)
    W = momentumCoeff * W_prev + (1 - momentumCoeff) * W_update;
    B = momentumCoeff * B_prev + (1 - momentumCoeff) * B_update;