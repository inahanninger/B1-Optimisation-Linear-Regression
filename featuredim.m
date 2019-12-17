
    [train_X, train_y] = Dvariable_generate_train_data(500,250)
    w = lsq_regression(train_X, train_y);
    [test_X, test_y] = Dvariable_generate_test_data(500,250);
    mse=compute_mean_squared_error(test_X,test_y,w);

    model=test_X*w

figure
plot(test_X*w,'g-x')
hold on
plot(test_y,'b-x')
legend('Predicted result','Actual result')
title(['MSE=',num2str(mse),', N=',num2str(length(train_y)),', D=',num2str(250)])
xlabel('Data Point')
ylabel('Student Final Grade')

[train_X, train_y] = Dvariable_generate_train_data(500,50)
    w = lsq_regression(train_X, train_y);
    [test_X, test_y] = Dvariable_generate_test_data(500,50);
    mse=compute_mean_squared_error(test_X,test_y,w);


figure(2)
plot(test_X*w,'r-x')
hold on
plot(test_y,'b-x')
legend('Predicted result','Actual result')
title(['MSE=',num2str(mse),', N=',num2str(length(train_y)),', D=',num2str(50)])
xlabel('Data Point')
ylabel('Student Final Grade')

