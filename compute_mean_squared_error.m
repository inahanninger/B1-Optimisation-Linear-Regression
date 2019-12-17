function mse=compute_mean_squared_error(test_X,test_y,w)
    Phi=test_X;
    Y=test_y;
    n_test=length(Y);
    mse=sum((Phi*w-Y).^2)/n_test