function lambda=identify_lambda2(train_X,train_y,val_X,val_y)
    lambda_set=[1e-3,1e-2,1e-1,1e0,1e1,1e2,1e3];
    mae_array=zeros(1,length(lambda_set));

    for i=[1:length(lambda_set)];
        w=smoothed_l1_regression(train_X,train_y,lambda_set(i));
        mae=compute_mean_abs_error(val_X,val_y,w);
        mae_array(i)=mae;
    end
    figure
    plot(log10(lambda_set),mae_array,'rx')
    xlabel('log10 of lambda')
    ylabel('Mean absolute error')

    [M,I] = min(mae_array);
    lambda=lambda_set(I)

