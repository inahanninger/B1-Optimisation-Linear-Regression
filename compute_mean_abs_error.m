function mae=compute_mean_abs_error(val_X,val_y,w)
    Phi=val_X;
    Y=val_y;
    n=length(Y);
    mae=sum(abs(Phi*w-Y))/n