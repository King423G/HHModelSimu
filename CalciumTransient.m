%% Get single calcium transient simulation

cal_0 = spike_1; % base on spike 1

cal_1 = cal_0;
cal_1(1:31) = 0;
cal_1(106:206) = 0;

% using interpolation for the first 31 time points
x1 = 1:15; x2 = 15:31; x3 = 53:120;
pre1 = interp1([1,8,15],[-30,-28,-25.5],x1,'spline');
cal_1(1:15) = pre1;
pre2 = interp1([15,20,25,31],[-25.5,-29,-42,-50.0166],x2,'spline');
cal_1(15:31) = pre2;
cal_1 = cal_1(1:101); % that's it!
plot(cal_1)
hold on

% cal_2 = cal_1;
% % x = [53, 71, 80, 95, 102, 113, 120];
% % q = [51.3452, 40.0345, 27.0083, 12.8052, -2.8529, -15.6039, -29.6759];
% x=[53,93,120]; q=[51.2452,15.8765,-29.6759];
% pre3 = interp1(x,q,x3,'spline');
% cal_2(53:120) = pre3;
% cal_3 = cal_2 (1:120);
% plot(cal_3);
% plot(cal_0(1:120));

%% add gausian noise

noise1 = 3 * ( rand (1, 101) - 0.5 );
noise2 = 3 * ( rand (1, 101) - 0.5 );
plot(cal_1 + noise1 + noise2 )