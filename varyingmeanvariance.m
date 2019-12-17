
mu=[[0.8,0.6,0.4,0.2],[0.7,0.6,0.5,0.4],[0.8,0.7,0.6,0.5],[0.9,0.2,0.8,0.3],[0.7 0.7 0.7 0.7]]
test_error=[]
train_error=[]
% %original
%     [train_X, train_y] = variable_generate_train_data(10000,[0.8,0.6,0.4,0.2])
%     [test_X, test_y] = variable_generate_test_data(10000,[0.8,0.6,0.4,0.2])
%     w = lsq_regression(train_X, train_y)
%     err=test_X*w-test_y
%     [f,xi] = ksdensity(err);
%     plot(xi,f)
% %     [p,x] = hist(err); plot(x,p/sum(p)); %PDF
%     ylabel('Probability density')
%     xlabel('Error')
%     hold on
%     mse=compute_mean_squared_error(test_X,test_y,w)
%     test_error=[test_error,mse]
%     mse=compute_mean_squared_error(train_X,train_y,w)
%     train_error=[train_error,mse]
%     
%  %perfectly matching results gaussians   
% [train_X, train_y] = variable_generate_train_data(10000,[0.7,0.6,0.5,0.4])
%     [test_X, test_y] = variable_generate_test_data(10000,[0.7,0.6,0.5,0.4])
%     w = lsq_regression(train_X, train_y)
%     err=test_X*w-test_y
%     [f,xi] = ksdensity(err);
%     plot(xi,f)
%     %[p,x] = hist(err); plot(x,p/sum(p)); %PDF
%     ylabel('Probability density')
%     xlabel('Error')
%     hold on
%     mse=compute_mean_squared_error(test_X,test_y,w)
%     test_error=[test_error,mse]
%     mse=compute_mean_squared_error(train_X,train_y,w)
%     train_error=[train_error,mse]
%     
%     %with offset of 0.1
%     [train_X, train_y] = variable_generate_train_data(10000,[0.8,0.7,0.6,0.5])
%     [test_X, test_y] = variable_generate_test_data(10000,[0.8,0.7,0.6,0.5])
%     w = lsq_regression(train_X, train_y)
%     err=test_X*w-test_y
%     [f,xi] = ksdensity(err);
%     plot(xi,f)
%     %[p,x] = hist(err); plot(x,p/sum(p)); %PDF
%     ylabel('Probability density')
%     xlabel('Error')
%     hold on
%     mse=compute_mean_squared_error(test_X,test_y,w)
%     test_error=[test_error,mse]
%     mse=compute_mean_squared_error(train_X,train_y,w)
%     train_error=[train_error,mse]
%     
%     %non linear
%     [train_X, train_y] = variable_generate_train_data(10000,[0.9,0.2,0.8,0.3])
%     [test_X, test_y] = variable_generate_test_data(10000,[0.9,0.2,0.8,0.3])
%     w = lsq_regression(train_X, train_y)
%     err=test_X*w-test_y
%     [f,xi] = ksdensity(err);
%     plot(xi,f)
%     %[p,x] = hist(err); plot(x,p/sum(p)); %PDF
%     ylabel('Probability density')
%     xlabel('Error')
%     hold on
%     mse=compute_mean_squared_error(test_X,test_y,w)
%     test_error=[test_error,mse]
%     mse=compute_mean_squared_error(train_X,train_y,w)
%     train_error=[train_error,mse]
%     
%     %lazy tutors predicting firsts on all collections
%     [train_X, train_y] = variable_generate_train_data(10000,[0.7, 0.7, 0.7, 0.7])
%     [test_X, test_y] = variable_generate_test_data(10000,[0.7, 0.7, 0.7, 0.7])
%     w = lsq_regression(train_X, train_y)
%     err=test_X*w-test_y
%     [f,xi] = ksdensity(err);
%     plot(xi,f)
% 
% %     [p,x] = hist(err); plot(x,p/sum(p)); %PDF
%     ylabel('Probability density')
%     xlabel('Error')
%     hold on
%     mse=compute_mean_squared_error(test_X,test_y,w)
%     test_error=[test_error,mse]
%     mse=compute_mean_squared_error(train_X,train_y,w)
%     train_error=[train_error,mse]
%     
%     title(['N=',num2str(length(train_y))])
%     legend('\mu=[0.8,0.6,0.4,0.2]','\mu=[0.7,0.6,0.5,0.4]','\mu=[0.8,0.7,0.6,0.5]','\mu=[0.9,0.2,0.8,0.3]','\mu=[0.7 0.7 0.7 0.7]')
%     
  %varying variance
    figure
    [test_X, test_y] = Svariable_generate_test_data(10000,0.05)
    [train_X, train_y] = Svariable_generate_train_data(10000,0.05)
    w = lsq_regression(train_X, train_y)
    err=test_X*w-test_y
    [f,xi] = ksdensity(err);
    plot(xi,f)
%     [p,x] = hist(err); plot(x,p/sum(p)); %PDF
    ylabel('Probability density')
    xlabel('Error')
    hold on
    mse=compute_mean_squared_error(test_X,test_y,w)
    test_error=[test_error,mse]
    mse=compute_mean_squared_error(train_X,train_y,w)
    train_error=[train_error,mse]

    %original
    [test_X, test_y] = Svariable_generate_test_data(10000,0.2)
    [train_X, train_y] = Svariable_generate_train_data(10000,0.2)
    w = lsq_regression(train_X, train_y)
    err=test_X*w-test_y
    [f,xi] = ksdensity(err);
    plot(xi,f)
    %[p,x] = hist(err); plot(x,p/sum(p)); %PDF
    ylabel('Probability density')
    xlabel('Error')
    hold on
    mse=compute_mean_squared_error(test_X,test_y,w)
    test_error=[test_error,mse]
    mse=compute_mean_squared_error(train_X,train_y,w)
    train_error=[train_error,mse]
   
    
    [test_X, test_y] = Svariable_generate_test_data(10000,0.5)
    [train_X, train_y] = Svariable_generate_train_data(10000,0.5)
    w = lsq_regression(train_X, train_y)
    err=test_X*w-test_y
    [f,xi] = ksdensity(err);
    plot(xi,f)
%     [p,x] = hist(err); plot(x,p/sum(p)); %PDF
    ylabel('Frequency')
    xlabel('Error')
    hold on
    mse=compute_mean_squared_error(test_X,test_y,w)
    test_error=[test_error,mse]
    mse=compute_mean_squared_error(train_X,train_y,w)
    train_error=[train_error,mse]
    
    title(['N=',num2str(length(train_y))])
    legend('\sigma=0.05','\sigma=0.2','\sigma=0.5')
    