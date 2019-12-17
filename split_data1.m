function [train_y,val_y] = split_data1(trainval_y)
    [trainval_X,trainval_y]=generate_train_data(10)
    n=length(trainval_y)
    
    
    first_y=[trainval_y(trainval_y>=0.7&trainval_y<=1)]
    upper_y=[trainval_y(trainval_y>=0.6&trainval_y<0.7)]
    lower_y=[trainval_y(trainval_y>=0.5&trainval_y<0.6)]
    third_y=[trainval_y(trainval_y>=0.4&trainval_y<0.5)]
    
    train_y=[first_y(1:round(0.8*length(first_y)))]
    train_y=[train_y;upper_y(1:round(0.8*length(upper_y)))]
    train_y=[train_y;lower_y(1:round(0.8*length(lower_y)))]
    train_y=[train_y;third_y(1:round(0.8*length(third_y)))]
    
    val_y=[first_y(1+round(0.8*n/4)):length(first_y)];
    val_y=[val_y,upper_y(1+floor(0.8*n/4)):length(upper_y)]
    val_y=[val_y,lower_y(1+floor(0.8*n/4)):length(lower_y)]
    val_y=[val_y,third_y(1+floor(0.8*n/4)):length(third_y)]
    
    
    
    
[m,n] = size(trainval_X) ;
P = 0.80 ;
idx = randperm(m)  ;
train_X = train_X(idx(1:round(P*m)),:) ; 
val_x = train_X(idx(round(P*m)+1:end),:) ;
train_y = train_y(idx(1:round(P*m))) ;
val_y = train_y(idx(round(P*m)+1:end)) ;
    