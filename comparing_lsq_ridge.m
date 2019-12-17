%comparing least squares regression to ridge regression
w_lsq = lsq_regression(trainval_X, trainval_y)
w_ridge=ridge_regression(trainval_X,trainval_y,lambda)
w_lasso=lasso(trainval_X,trainval_y,'Lambda',1) %is this right??


mse_lsq=compute_mean_squared_error(test_X,test_y,w_lsq)
mse_ridge=compute_mean_squared_error(test_X,test_y,w_ridge)
mse_lasso=compute_mean_squared_error(test_X,test_y,w_lasso)