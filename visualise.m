%Visualising lsq_regression

[train_X, train_y] = generate_train_data(100) 
 w = lsq_regression(train_X, train_y); %to build the model
 [test_X, test_y] = generate_test_data(100); %to validate model

figure
plot(test_X*w,'g-x')
hold on
plot(test_y,'b-x')
hold on
%plot(train_y)

mse=compute_mean_squared_error(test_X,test_y,w)
mse1=compute_mean_squared_error(train_X,train_y,w)
title(['Least Squares','Test Error=',num2str(mse),', Train Error=',num2str(mse1)])
xlabel('Data Point')
ylabel('Student Final Grade')
legend('Predicted result','Test data result')

%Visualisng ridge regression
%lambda=k_fold(train_X,train_y,5)
w = ridge_regression(train_X, train_y,lambda);
figure(2)
plot(test_X*w,'g-x')
hold on
plot(test_y,'b-x')
hold on
%plot(train_y)

mse=compute_mean_squared_error(test_X,test_y,w)
mse1=compute_mean_squared_error(train_X,train_y,w)
title(['Ridge Regression','Test Error=',num2str(mse),', Train Error=',num2str(mse1)])
xlabel('Data Point')
ylabel('Student Final Grade')
legend('Predicted result','Test data result')

%Visualisng lasso regression
figure(3)
%lambda=k_fold_l1(train_X,train_y,5)
 w = smoothed_l1_regression(train_X, train_y,lambda);
 plot(test_X*w,'g-x')
hold on
plot(test_y,'b-x')
hold on
%plot(train_y)

mse=compute_mean_squared_error(test_X,test_y,w)
mse1=compute_mean_squared_error(train_X,train_y,w)
title(['Lasso Regression','Test Error=',num2str(mse),', Train Error=',num2str(mse1)])
xlabel('Data Point')
ylabel('Student Final Grade')
legend('Predicted result','Test data result')


