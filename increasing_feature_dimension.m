d_vector=[5:10:500]
run_time=zeros(1,length(d_vector));
mse=zeros(1,length(d_vector));
mse1=zeros(1,length(d_vector));
mse2=zeros(1,length(d_vector));


for k=[1:length(d_vector)]
    [train_X, train_y] = Dvariable_generate_train_data(1000,d_vector(k))
    %tic
    w = lsq_regression(train_X, train_y);
	%run_time(k)=toc
    w2 = ridge_regression(train_X, train_y,0.001);

    [test_X, test_y] = Dvariable_generate_test_data(1000,d_vector(k));
    mse(k)=compute_mean_squared_error(test_X,test_y,w);
    mse1(k)=compute_mean_squared_error(train_X,train_y,w);
    mse2(k)=compute_mean_squared_error(test_X,test_y,w2);

end

% R = corrcoef(d_vector,run_time)
% txt=['\rho(d,t)=',num2str(R(1,2))]
%figure(1)
%plot(d_vector,run_time)
%text(50,max(d_vector),txt)
%title(txt)
xlabel('Dimension of feature vector')
ylabel('Run time')

figure(2)
plot(d_vector,mse)
xlabel('Dimension of feature vector')
ylabel('MSE')
hold on
plot(d_vector,mse1)
hold on
plot(d_vector,mse2)

legend('Test Error','Train Error', 'Ridge Regression Test Error')
