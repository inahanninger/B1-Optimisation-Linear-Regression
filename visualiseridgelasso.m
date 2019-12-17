%Visualising the effect of lambda on magnitude of penalty for each feature
lambda_set=[1e-3,1e-2,1e-1,1e0,1e1,1e2,1e3];
[m,n]=size(w)

weight_set=zeros(length(lambda_set),m)
figure(1)
for i=[1:length(lambda_set)];
    w=ridge_regression(train_X,train_y,lambda_set(i))
    weight_set(i,:)=w.'
end

for i=[1:m];
    plot(log10(lambda_set),weight_set(:,i))
    hold on
    
end
title('Ridge Regularisation')
xlabel('log_1_0 (\lambda)')
ylabel('magnitude of weight')
%legend([housingAttributes])


weight_set2=zeros(length(lambda_set),m)
for i=[1:length(lambda_set)];
    w=smoothed_l1_regression(train_X,train_y,lambda_set(i))
    weight_set2(i,:)=w.'
end

figure(2)
for i=[1:m];
    plot(log10(lambda_set),weight_set2(:,i))
    hold on
    
end
title('Lasso Regularisation')
xlabel('log_1_0 (\lambda)')
ylabel('magnitude of weight')
%legend([housingAttributes])
