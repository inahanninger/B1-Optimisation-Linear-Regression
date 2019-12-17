%Varying eta, plot MAE against no. iterations

eta_set=[0.1,0.01,0.001,0.0001]
for i=[1:length(eta_set)]
    w =var_smoothed_l1_regression(train_X,train_y,1e-3,eta_set(i))
    hold on
end

legend('\eta = 0.1','\eta = 0.01','\eta =0.001','\eta =0.0001')
