[train_X, train_y] = generate_train_data(1000) ; %to build the model
 [test_X, test_y] = generate_test_data(1000); %to validate model
 
 %LSQ
  w = lsq_regression(train_X, train_y)
err1=test_X*w-test_y
% histogram(err,'Normalization','pdf')
[f,xi] = ksdensity(err);
plot(xi,f/sum(f))
% [p,x] = hist(err); 
% plot(x,p/sum(p),'r'); %PDF
ylabel('Probability density')
xlabel('Error')

model=test_X*w

% %Ridge
%lambda=k_fold(train_X,train_y,5)
%  w1 = ridge_regression(train_X, train_y,1);
%  err1=test_X*w1-test_y
%  figure(2)
% [p,x] = hist(err1); plot(x,p/sum(p),'b'); %PDF