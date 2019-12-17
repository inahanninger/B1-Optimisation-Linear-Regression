[train_X, train_y] = generate_train_data(200) 
 w = lsq_regression(train_X, train_y); %to build the model
 [test_X, test_y] = generate_test_data(200); %to validate model
 
 model=test_X*w
 
 figure(1)
 plot(test_y(1:50),model(1:50),'rx')
 hold on
 plot(test_y(51:100),model(51:100),'gx')
 hold on
 plot(test_y(101:150),model(101:150),'bx')
 hold on
 plot(test_y(151:200),model(151:200),'mx')
 xlabel('Actual output')
 ylabel('Predicted output')
 mse=compute_mean_squared_error(test_X,test_y,w)
 title(['Least Squares Regression, MSE=',num2str(mse),', N=',num2str(length(train_y))])
xlim([0 inf])
ylim([0 inf])


 
 %Ridge
 
 %lambda=k_fold(train_X,train_y,5)
 w = ridge_regression(train_X, train_y,lambda);
 model=test_X*w
 figure(2)
 plot(test_y(1:50),model(1:50),'rx')
 hold on
 plot(test_y(51:100),model(51:100),'gx')
 hold on
 plot(test_y(101:150),model(101:150),'bx')
 hold on
 plot(test_y(151:200),model(151:200),'mx')
 hold on
 xlabel('Actual output')
 ylabel('Predicted output')
 mse=compute_mean_squared_error(test_X,test_y,w)
 title(['Ridge Regression, MSE=',num2str(mse),', N=',num2str(length(train_y))])
 xlim([0 inf])
ylim([0 inf])