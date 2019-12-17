%Bias and Variance Tradeoff

%Looking at increasing complexity effect on error
d_vector=[1:5:500];
err_vector=zeros(1,length(d_vector));
err_vector_train=zeros(1,length(d_vector));
% bias_vector=zeros(1,length(d_vector));
% variance_vector=zeros(1,length(d_vector));

for k=[1:length(d_vector)];
    [train_X, train_y] = Dvariable_generate_train_data(1000,d_vector(k));
    w = lsq_regression(train_X, train_y);
    [test_X, test_y] = Dvariable_generate_test_data(1000,d_vector(k));
	mse=compute_mean_squared_error(test_X,test_y,w);
    err_vector(k)=mse;
    mse2=compute_mean_squared_error(train_X,train_y,w);
    err_vector_train(k)=mse2;
    
%     bias_vector(k)=mean(mean(train_X*w)-train_y)
%     variance_vector(k)=mean(train_X*w-mean((train_X*w).^2))
end
figure
plot(d_vector,err_vector)
hold on
plot(d_vector,err_vector_train)
% hold on
% plot(d_vector,bias_vector.^2)
% hold on
%plot(d_vector,variance_vector)
xlabel('Number of features')
ylabel('Mean squared error')
legend('Error on test data','Error on train data','Bias','Variance')



