%K fold cross validation
function opt_lambda=k_fold_lp(train_X,train_y,k)

lambda_set=[1e-3,1e-2,1e-1,1e0,1e1,1e2,1e3];    
[m,n] = size(train_X) ;
    idx = randperm(m)  ;
    
    trainval_X = train_X(idx,:);
    trainval_y= train_y(idx);
    
    remainder_X=[]
    remainder_y=[]
    best_lambda=[]
    avg_mae=[]
    
    for i=[1:k]
        val_X = trainval_X(floor(m*(i-1)/k)+1:floor(m*i/k),:) ; 
            train_X = [remainder_X; trainval_X(floor(m*i/k)+1:end,:)] ;
            val_y = trainval_y(floor(m*(i-1)/k)+1:floor(m*i/k)) ;
            train_y = [remainder_y; trainval_y(floor(m*i/k)+1:end)] ; 
        remainder_X=[remainder_X; val_X]
        remainder_y=[remainder_y; val_y]
        
        mae_array=zeros(1,length(lambda_set))
        
        for j=[1:length(lambda_set)]
            w=lp_l1_regression(train_X,train_y,lambda_set(j));
            mae=compute_mean_abs_error(val_X,val_y,w);
            mae_array(j)=mae;
        end
      
    plot(log10(lambda_set),mae_array)
    xlabel('log_{10}\lambda')
    ylabel('Mean absolute error')
    hold on
    
    [M,I] = min(mae_array);
    lambda_k=lambda_set(I)
    best_lambda=[best_lambda,lambda_k]
    avg_mae=[avg_mae,min(mae_array)]
    
    end
    
    opt_lambda=mode(best_lambda)
    avg_mae=mean(avg_mae)
    title(['Linear Programming K fold cross validation, k=',num2str(k), ', N=',num2str(m)])
    dim = [0.2 0.5 0.3 0.3];
    str = {['Optimal \lambda=',num2str(opt_lambda)],['Average MAE=',num2str(avg_mae)]};
    annotation('textbox',dim,'String',str,'FitBoxToText','on')
        