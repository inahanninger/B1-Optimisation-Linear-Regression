%Compare Linear Programming and Stochastic Gradient Descent

   run_timeLP=zeros(1,100);
   run_timeGD=zeros(1,100);
 for i=[1:100]
    [train_X, train_y] = generate_train_data(100);
    tic
    w=lp_l1_regression(train_X,train_y,lambda);
    run_timeLP(i)=toc
    tic
    w = stochastic_smoothed_regression(train_X, train_y, lambda);
    run_timeLP(i)=toc
 end
 
 plot(run_time)
 avg_LP=mean(run_time)