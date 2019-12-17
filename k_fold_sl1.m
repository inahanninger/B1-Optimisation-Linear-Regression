function opt_lambda=k_fold_sl1(train_X,train_y,k)
clear lambda
    lambda_set=[1e-3,1e-2,1e-1,1e0,1e1,1e2,1e3]; 
    remainder_X=[]
    remainder_y=[]
    best_lambda_set=[]
    avg_mse=[]   
    [m,n] = size(train_X) ;
    idx = randperm(m)  ;
    trainval_X = train_X(idx,:);
    trainval_y= train_y(idx);
    
    for i=[1:k]
        val_X = trainval_X(floor(m*(i-1)/k)+1:floor(m*i/k),:) ; 
        train_X = [remainder_X; trainval_X(floor(m*i/k)+1:end,:)] ;
        val_y = trainval_y(floor(m*(i-1)/k)+1:floor(m*i/k)) ;
        train_y = [remainder_y; trainval_y(floor(m*i/k)+1:end)] ;            
        remainder_X=[remainder_X; val_X]
        remainder_y=[remainder_y; val_y];
        
        mse_array=zeros(1,length(lambda_set))       
        for j=[1:length(lambda_set)]
            w=stochastic_smoothed_regression(train_X,train_y,lambda_set(j));
            mse_array(j)=compute_mean_squared_error(val_X,val_y,w);
        end
         
        plot(log10(lambda_set),mse_array)
        xlabel('log_{10}\lambda')
        ylabel('Mean squared error')
        hold on
   

        [M,I] = min(mse_array);
        lambda_k=lambda_set(I)
        best_lambda_set=[best_lambda_set,lambda_k]
        avg_mse=[avg_mse,min(mse_array)]
    
    end
    
    opt_lambda=mode(best_lambda_set)
    avg_mse=mean(avg_mse)
    title(['K fold cross validation, k=',num2str(k), ', N=',num2str(m)])
    dim = [0.2 0.5 0.3 0.3];
    str = {['Optimal \lambda=',num2str(opt_lambda)],['Average MSE=',num2str(avg_mse)]};
    annotation('textbox',dim,'String',str,'FitBoxToText','on')
    end
        