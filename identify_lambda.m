function lambda=identify_lambda(train_X,train_y,val_X,val_y)
    lambda_set=[1e-3,1e-2,1e-1,1e0,1e1,1e2,1e3];
    mse_array=zeros(1,length(lambda_set));

    for i=[1:length(lambda_set)];
        w=ridge_regression(train_X,train_y,lambda_set(i));
        mse=compute_mean_squared_error(val_X,val_y,w);
        mse_array(i)=mse;
    end

    plot(log10(lambda_set),mse_array)
    xlabel('log_{10}(\lambda)')
    ylabel('Mean squared error')

    [M,I] = min(mse_array);
    lambda=lambda_set(I)
   title(['Ridge Regression, optimal \lambda =',num2str(lambda)])
    
end

