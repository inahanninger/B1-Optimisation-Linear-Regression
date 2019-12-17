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
title(['Test Error=',num2str(mse),', Train Error=',num2str(mse1)])
xlabel('Data Point')
ylabel('Student Final Grade')
legend('Predicted result','Test data result','Training data result')