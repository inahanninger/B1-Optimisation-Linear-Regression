n_train_vector=[5:10:200]
run_time=zeros(1,length(n_train_vector));

mse=zeros(1,length(n_train_vector));
mse1=zeros(1,length(n_train_vector));


for k=[1:length(n_train_vector)]
   [train_X, train_y] = generate_train_data(n_train_vector(k));
   %tic
   w = lsq_regression(train_X, train_y);
    %run_time(k)=toc
    [test_X, test_y] = generate_test_data(n_train_vector(k))
    mse(k)=compute_mean_squared_error(test_X,test_y,w)
end

for k=[1:length(n_train_vector)]
   [train_X, train_y] = generate_train_data(n_train_vector(k));
   %tic
   w = lsq_regression(train_X, train_y);
    %run_time(k)=toc
    mse1(k)=compute_mean_squared_error(train_X,train_y,w)
end

figure(2)
plot(n_train_vector,mse)
xlabel('Size of training data set, N')
ylabel('MSE')
hold on
plot(n_train_vector,mse1)
title('D=20')
legend('Test error','Train error')



%%
% SD=std(run_time)
% meann=mean(run_time)
% 
% %plot(n_train_vector,run_time)
% %xlabel('Size of training data set, N')
% %ylabel('Run time(s)')
% 
% ten=zeros(1,1000)
% for i=[1:1000]
%     [train_X, train_y] = generate_train_data(10);
%     tic
%     w = lsq_regression(train_X, train_y);
% 	ten(i)=toc
% end
% 
% hundred=zeros(1,1000)
% for i=[1:1000]
%     [train_X, train_y] = generate_train_data(100);
%     tic
%     w = lsq_regression(train_X, train_y);
% 	hundred(i)=toc
% end
% 
% thou=zeros(1,1000)
% for i=[1:1000]
%     [train_X, train_y] = generate_train_data(1000);
%     tic
%     w = lsq_regression(train_X, train_y);
% 	thou(i)=toc
% end

%%
% ten_mean=mean(ten)
% ten_SD=std(ten)
% hun_mean=mean(hundred)
% hun_SD=std(thou)
% thou_mean=mean(thou)
% thou_SD=std(thou)
% 
% average=[ten_mean,hun_mean,thou_mean]
% SD=[ten_SD,hun_SD,thou_SD]
% 
% plot([10,100,1000],average)
% hold on
% plot([10,100,1000],SD)

    