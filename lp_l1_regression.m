function w=lp_l1_regression(train_X,train_y,lambda)
[n,d]=size(train_X)
f=[zeros(d,1);lambda/2*ones(d,1);ones(n,1)/n];
A=[eye(d),-eye(d),zeros(d,n); -eye(d),-eye(d), zeros(d,n); train_X, zeros(n,d),-eye(n); -train_X, zeros(n,d),-eye(n)];
b=[zeros(2*d,1);train_y;-train_y];
x=linprog(f,A,b)
w=x(1:d)
end
