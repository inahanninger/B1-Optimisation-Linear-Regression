[trainval_X, trainval_y] = generate_train_data(1000);
[train_X,train_y,val_X,val_y] = split_data(trainval_X,trainval_y);
[test_X, test_y] = generate_test_data(1000)

%Identify lambda for linear programming

lambda_set=[1e-3,1e-2,1e-1,1e0,1e1,1e2,1e3];
    mae_array=zeros(1,length(lambda_set));

    for i=[1:length(lambda_set)];
        w=lp_l1_regression(train_X,train_y,lambda_set(i));
        mae=compute_mean_abs_error(val_X,val_y,w);
        mae_array(i)=mae;
    end

    plot(log10(lambda_set),mae_array,'rx')
    xlabel('log10 of lambda')
    ylabel('Mean absolute error')

    [M,I] = min(mae_array);
    lambda=lambda_set(I)
    title(['\lambda=',num2str(lambda)])
    
    %find best w and find MAE over test data
   w=lp_l1_regression(train_X,train_y,lambda);
    mae=compute_mean_abs_error(test_X,test_y,w)
    

    
    
    
    