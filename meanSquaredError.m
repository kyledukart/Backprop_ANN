function err = meanSquaredError(t, a)
    err = sum((t - a) .^ 2) / length(t);