d_vector=[5:10:500]
run_time=zeros(1,length(d_vector));
run_time2=zeros(1,length(d_vector));
mae=zeros(1,length(d_vector));
mae2=zeros(1,length(d_vector));

for k=[1:length(d_vector)]
    [train_X, train_y] = Dvariable_generate_train_data(1000,d_vector(k));
    [test_X, test_y] = Dvariable_generate_test_data(1000,d_vector(k));
    tic
    w=lp_l1_regression(train_X,train_y,0.001);
	run_time(k)=toc
    tic
    w=stochastic_smoothed_regression(train_X,train_y,0.1);
	run_time2(k)=toc
    mae(k)=compute_mean_abs_error(test_X,test_y,w);
    mae2(k)=compute_mean_abs_error(test_X,test_y,w);
end

R = corrcoef(d_vector,run_time)
txt=['\rho(d,t)=',num2str(R(1,2))]
figure(1)
plot(d_vector,run_time)
text(50,max(d_vector),txt)
title(txt)
xlabel('Dimension of feature vector')
ylabel('Run time')

figure(2)
plot(d_vector,mae)
xlabel('Dimension of feature vector')
ylabel('MSE')
