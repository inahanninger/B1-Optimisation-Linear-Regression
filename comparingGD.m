%Comparing GD to SGD
sz=size(train_X)
n=sz(1)

tic
w =smoothed_l1_regression(train_X,train_y,1e-3)
GDtime=toc
hold on

tic
w = stochastic_smoothed_regression(train_X, train_y, 0.1)
SGDtime=toc
hold on

%w = minibatch_stochastic_smoothed_regression(train_X, train_y, 0.1)

title(['\lambda_{GD}=',num2str(0.001),', \lambda_{SGD}= ',num2str(0.1),', \tau =0.1', ', N=', num2str(n)])
legend('Gradient Descent, \eta=0.04','Stochastic Gradient Descent','Mini-batch Gradient Descent, Batch size=10 ')
dim = [0.2 0.5 0.3 0.3];
str = {['Iterations (GD) = 52'],['Iterations (SGD) = 110'],['Run time(GD) = ',num2str(GDtime)],['Run time(SGD) = ',num2str(SGDtime)]};
annotation('textbox',dim,'String',str,'FitBoxToText','on')

%Comparing run time
times=[GDtime, SGDtime, LPtime]

