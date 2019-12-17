function w = lsq_regression(train_X, train_y)

    Phi=train_X;
    Y=train_y;
    A=Phi.'*Phi;
    b=Phi.'*Y;
    w=inv(A)*b %w is a 20x1 matrix
    
    

