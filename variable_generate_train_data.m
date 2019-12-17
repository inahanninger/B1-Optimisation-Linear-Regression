function	[train_X, train_y] = variable_generate_train_data(n_train,mu)

	mu_1 = mu(1); 
    sigma_1 = Constants.sigma_1;
	mu_21 = mu(2); 
    sigma_21 = Constants.sigma_21;
	mu_22 = mu(3); 
    sigma_22 = Constants.sigma_22;
	mu_3 = mu(4);
    sigma_3 = Constants.sigma_3;
    
    d=20

	rng(0);

	train_X = []; train_y = [];

	train_X = [train_X; sigma_1*randn(floor(n_train/4),d)+mu_1];
	train_y = [train_y; 0.7+0.3*rand(floor(n_train/4),1)];

	train_X = [train_X; sigma_21*randn(floor(n_train/4),d)+mu_21];
	train_y = [train_y; 0.6+0.1*rand(floor(n_train/4),1)];

	train_X = [train_X; sigma_22*randn(floor(n_train/4),d)+mu_22];
	train_y = [train_y; 0.5+0.1*rand(floor(n_train/4),1)];

	n_rem = n_train - length(train_y);
	train_X = [train_X; sigma_3*randn(n_rem,d)+mu_3];
	train_y = [train_y; 0.4+0.1*rand(n_rem,1)];
    train_X = [ones(n_train,1),train_X]