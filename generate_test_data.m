function	[test_X, test_y] = generate_test_data(n_test)

	mu_1 = Constants.mu_1; sigma_1 = Constants.sigma_1;
	mu_21 = Constants.mu_21; sigma_21 = Constants.sigma_21;
	mu_22 = Constants.mu_22; sigma_22 = Constants.sigma_22;
	mu_3 = Constants.mu_3; sigma_3 = Constants.sigma_3;

	d = 20;

	rng(1);

	test_X = []; test_y = [];

	test_X = [test_X; sigma_1*randn(floor(n_test/4),d)+mu_1];
	test_y = [test_y; 0.7+0.3*rand(floor(n_test/4),1)];

	test_X = [test_X; sigma_21*randn(floor(n_test/4),d)+mu_21];
	test_y = [test_y; 0.6+0.1*rand(floor(n_test/4),1)];

	test_X = [test_X; sigma_22*randn(floor(n_test/4),d)+mu_22];
	test_y = [test_y; 0.5+0.1*rand(floor(n_test/4),1)];

	n_rem = n_test - length(test_y);
	test_X = [test_X; sigma_3*randn(n_rem,d)+mu_3];
	test_y = [test_y; 0.4+0.1*rand(n_rem,1)];
    test_X = [ones(n_test,1),test_X]
