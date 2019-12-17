function w=ridge_regression(train_X,train_y,lambda)
    Phi=train_X;
    Y=train_y;
    A=Phi.'*Phi+lambda*eye(size(train_X,2));
    b=Phi.'*Y;
    w=pinv(A)*b