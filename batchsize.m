%batch size

sz=size(train_X);
n=sz(1);
batch_set=[1,10,100]
time_set=[]

for i=[1:length(batch_set)]
    tic
    w = var_minibatch_stochastic_smoothed_regression(train_X, train_y, 0.1,batch_set(i))
    time_set=[time_set,toc]
    title(['\lambda =',num2str(0.1),', \tau =',num2str(0.1), ', N =',num2str(n)])
end

legend('b=1','b=10','b=100')
dim = [0.2 0.5 0.3 0.3];
str = {'Run time per iteration:',['b=1  | ',num2str(time_set(1)/51)],['b=10 | ',num2str(time_set(2)/22)],['b=100| ',num2str(time_set(3)/14)]};
annotation('textbox',dim,'String',str,'FitBoxToText','on')