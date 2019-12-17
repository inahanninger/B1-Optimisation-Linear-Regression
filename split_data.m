function [train_X,train_y,val_X,val_y] = split_data(trainval_X,trainval_y)
    %[trainval_X,trainval_y]=generate_train_data(100)
    
    [m,n] = size(trainval_X) ;
    P = 0.80 ;
    idx = randperm(m)  ;
    train_X = trainval_X(idx(1:round(P*m)),:) ; 
    val_X = trainval_X(idx(round(P*m)+1:end),:) ;
    train_y = trainval_y(idx(1:round(P*m))) ;
    val_y = trainval_y(idx(round(P*m)+1:end)) ;