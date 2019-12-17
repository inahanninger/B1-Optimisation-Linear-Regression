function w = var_minibatch_stochastic_smoothed_regression(train_X, train_y, lambda,b)
hold on
sz=size(train_X);
n=sz(1);
d=sz(2);   
w = zeros(d,1);
[test_X, test_y] = generate_test_data(sz(1))
tau = 0.1;
num = 0;
mae_vector=[];
f_vector=[]

f_old=0;
f_new=1;
err=f_new-f_old;
num=0


while abs(err)>0.0001
    num=num+1

    %computing objective function
        s1 = 0; 
        s2 = 0;
        for j = 1:d
            s1 = s1 + (abs(w(j)) + tau*(log(1 + exp(-2*abs(w(j))/tau))));
        end
        s1=(lambda/2)*s1
        e = zeros(1,n);
        for j = 1:n
            e(j) = abs(train_X(j,:)*w-train_y(j));
            s2 = s2 + (e(j)+tau*(log(1+exp(-2*e(j)))));
        end
        s2=(1/n)*s2

        temp=f_old
        f_new = s1 + s2;
        f_vector=[f_vector,f_new]

        f_old=f_new
        err=f_new-temp


    %computing grad of objective function    
    grad=[];
    batch=randi([1 n],1,b)
    for j = 1:d
        term1 = tanh(w(j)/tau);
        term2 = 0;
        %summing examples in a batch to compute term 2
        for k = 1:b
        term2k = train_X(batch(k),j) * tanh((train_X(batch(k),:)*w - train_y(batch(k)))/tau);
        term2 = term2 + term2k; % term2k is added to term2 at every iteration of k
        end
        grad_j = (lambda/2) * term1 + (1/b)*term2;
        grad = [grad;grad_j]; % grad is concatenated with grad_j at every iteration of j   
    end
    eta = 1/(num+1);
    w=w-eta*grad;

    mae_vector=[mae_vector,compute_mean_abs_error(test_X,test_y,w)];

end

plot(mae_vector)
xlabel('Number of iterations')
ylabel('Mean Absolute Error')
title(['\lambda =',num2str(lambda),', \tau =',num2str(tau), ', \eta =',num2str(eta), ', num =',num2str(num)])

end
    