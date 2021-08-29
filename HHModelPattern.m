%% store four spikes in one array
 
spike = zeros(NUM_spikes,max(steps));
spike(1,1:steps(1)) = spike_1;
spike(2,1:steps(2)) = spike_2;
spike(3,1:steps(3)) = spike_3;
spike(4,1:steps(4)) = spike_4;

% some initial arrays
dt_arr = 0.01:0.01:0.1; % different time steps
num_arr = 1:1:50; % number of spikes during one period

%% Pattern of LPeD2

[ vol1, l1 ] = generate_pattern( dt_arr(6), num_arr(6), steps, spike);
[ vol2, l2 ] = generate_pattern( dt_arr(3), num_arr(11), steps, spike);
[ vol3, l3 ] = generate_pattern( dt_arr(5), num_arr(2), steps, spike);
[ vol4, l4 ] = generate_pattern( dt_arr(7), num_arr(7), steps, spike);
[ vol5, l5 ] = generate_pattern( dt_arr(3), num_arr(8), steps, spike);
[ vol6, l6 ] = generate_pattern( dt_arr(8), num_arr(4), steps, spike);
[ vol7, l7 ] = generate_pattern( dt_arr(6), num_arr(10), steps, spike);

vol_lped2 = zeros(2, l1+l2+l3+l4+l5+l6+l7);
vol_lped2(2,:) = [ vol1(2,:), vol2(2,:), vol3(2,:), vol4(2,:), vol5(2,:), vol6(2,:), vol7(2,:)];
vol_lped2(1,1:l1) = vol1(1,:);
vol_lped2(1,l1+1:l1+l2) = vol_lped2(1,l1) + vol2(1,:);
vol_lped2(1,l1+l2+1:l1+l2+l3) = vol_lped2(1,l1+l2) + vol3(1,:);
vol_lped2(1,l1+l2+l3+1:l1+l2+l3+l4) = vol_lped2(1,l1+l2+l3) + vol4(1,:);
vol_lped2(1,l1+l2+l3+l4+1:l1+l2+l3+l4+l5) = vol_lped2(1,l1+l2+l3+l4) + vol5(1,:);
vol_lped2(1,l1+l2+l3+l4+l5+1:l1+l2+l3+l4+l5+l6) = vol_lped2(1,l1+l2+l3+l4+l5) + vol6(1,:);
vol_lped2(1,l1+l2+l3+l4+l5+l6+1:l1+l2+l3+l4+l5+l6+l7) = vol_lped2(1,l1+l2+l3+l4+l5+l6) + vol7(1,:);

fprintf('L.Pe.D2 Pattern Completed.\n');

%% plot of lped2

plot(vol_lped2(1,:),vol_lped2(2,:),'k');
box off
axis off
% xticks([0 3 6 9 12]);
h=gca; 
h.XAxis.TickLength = [0 0];
h.YAxis.TickLength = [0 0];
set(gcf,'Position',[200 200 1200 600]);
xticks('auto');
% random tick labels, doesn't matter
% xticklabels([1 4 7 10 13 18 21 29 66]);

%% pattern of column motoneuron

[ vol1, l1 ] = generate_pattern( dt_arr(6), num_arr(7), steps, spike);
[ vol2, l2 ] = generate_pattern( dt_arr(4), num_arr(3), steps, spike);
[ vol3, l3 ] = generate_pattern( dt_arr(2), num_arr(20), steps, spike);
[ vol4, l4 ] = generate_pattern( dt_arr(8), num_arr(5), steps, spike);
[ vol5, l5 ] = generate_pattern( dt_arr(7), num_arr(9), steps, spike);
[ vol6, l6 ] = generate_pattern( dt_arr(3), num_arr(11), steps, spike);
[ vol7, l7 ] = generate_pattern( dt_arr(6), num_arr(7), steps, spike);
[ vol8, l8 ] = generate_pattern( dt_arr(4), num_arr(10), steps, spike);
[ vol9, l9 ] = generate_pattern( dt_arr(5), num_arr(12), steps, spike);

vol_moto = zeros(2, l1+l2+l3+l4+l5+l6+l7+l8+l9);
vol_moto(2,:) = [ vol1(2,:), vol2(2,:), vol3(2,:), vol4(2,:), vol5(2,:), vol6(2,:), vol7(2,:), vol8(2,:), vol9(2,:)];
vol_moto(1,1:l1) = vol1(1,:);
vol_moto(1,l1+1:l1+l2) = vol_moto(1,l1) + vol2(1,:);
vol_moto(1,l1+l2+1:l1+l2+l3) = vol_moto(1,l1+l2) + vol3(1,:);
vol_moto(1,l1+l2+l3+1:l1+l2+l3+l4) = vol_moto(1,l1+l2+l3) + vol4(1,:);
vol_moto(1,l1+l2+l3+l4+1:l1+l2+l3+l4+l5) = vol_moto(1,l1+l2+l3+l4) + vol5(1,:);
vol_moto(1,l1+l2+l3+l4+l5+1:l1+l2+l3+l4+l5+l6) = vol_moto(1,l1+l2+l3+l4+l5) + vol6(1,:);
vol_moto(1,l1+l2+l3+l4+l5+l6+1:l1+l2+l3+l4+l5+l6+l7) = vol_moto(1,l1+l2+l3+l4+l5+l6) + vol7(1,:);
vol_moto(1,l1+l2+l3+l4+l5+l6+l7+1:l1+l2+l3+l4+l5+l6+l7+l8) = vol_moto(1,l1+l2+l3+l4+l5+l6+l7) + vol8(1,:);
vol_moto(1,l1+l2+l3+l4+l5+l6+l7+l8+1:l1+l2+l3+l4+l5+l6+l7+l8+l9) = vol_moto(1,l1+l2+l3+l4+l5+l6+l7+l8) + vol9(1,:);

fprintf('Column motoneuron Pattern Completed.\n');
%% plot of motoneuron

plot(vol_moto(1,:),vol_moto(2,:),'k');
box off
axis off
h=gca; 
h.XAxis.TickLength = [0 0];
h.YAxis.TickLength = [0 0];
set(gcf,'Position',[200 200 1200 600]);
xticks('auto');

%% pattern of lped11

L11 = [666, 0, 1300, 0, 50, 0, 20, 0, 200 ] ;
l1 = L11(1); vol1 = zeros(2,l1); vol1(1,:) = 1:l1;
vol1(2,:) = rand(1,l1) * 1.1 - 67 ;
[ vol2, l2 ] = generate_pattern (dt_arr(5), num_arr(3),steps,spike);
l3 = L11(3); vol3 = zeros(2,l3); vol3(1,:) = 1:l3;
vol3(2,1:20) = rand(1,20) * 1.1 - 68 ;
vol3(2,21:40) = rand(1,20) * 1.2 - 66 ;
vol3(2,41:l3) = rand(1,l3-40) * 1.1 - 67 ;
[ vol4, l4 ] = generate_pattern (dt_arr(6), num_arr(2),steps,spike);
l5 = L11(5); vol5 = zeros(2,l5); vol5(1,:) = 1:l5;
vol5(2,:) = rand(1,l5) * 1.1 - 67 ;
[ vol6, l6 ] = generate_pattern (dt_arr(4), num_arr(3),steps,spike);
l7 = L11(7); vol7 = zeros(2,l7); vol7(1,:) = 1:l7;
vol7(2,:) = rand(1,l7) * 1.1 - 69 ;
[ vol8, l8 ] = generate_pattern (dt_arr(5), num_arr(2),steps,spike);
l9 = L11(9); vol9 = zeros(2,l9); vol9(1,:) = 1:l9;
vol9(2,:) = rand(1,l9) * 1.1 - 67 ;

vol_lped11 = zeros (2, l1+l2+l3+l4+l5+l6+l7+l8+l9);
vol_lped11(2,:) = [ vol1(2,:), vol2(2,:), vol3(2,:), vol4(2,:), vol5(2,:), vol6(2,:), vol7(2,:), vol8(2,:), vol9(2,:) ];
vol_lped11(1,1:l1) = vol1(1,:);
vol_lped11(1,l1+1:l1+l2) = vol_lped11(1,l1) + vol2(1,:);
vol_lped11(1,l1+l2+1:l1+l2+l3) = vol_lped11(1,l1+l2) + vol3(1,:);
vol_lped11(1,l1+l2+l3+1:l1+l2+l3+l4) = vol_lped11(1,l1+l2+l3) + vol4(1,:);
vol_lped11(1,l1+l2+l3+l4+1:l1+l2+l3+l4+l5) = vol_lped11(1,l1+l2+l3+l4) + vol5(1,:);
vol_lped11(1,l1+l2+l3+l4+l5+1:l1+l2+l3+l4+l5+l6) = vol_lped11(1,l1+l2+l3+l4+l5) + vol6(1,:);
vol_lped11(1,l1+l2+l3+l4+l5+l6+1:l1+l2+l3+l4+l5+l6+l7) = vol_lped11(1,l1+l2+l3+l4+l5+l6) + vol7(1,:);
vol_lped11(1,l1+l2+l3+l4+l5+l6+l7+1:l1+l2+l3+l4+l5+l6+l7+l8) = vol_lped11(1,l1+l2+l3+l4+l5+l6+l7) + vol8(1,:);
vol_lped11(1,l1+l2+l3+l4+l5+l6+l7+l8+1:l1+l2+l3+l4+l5+l6+l7+l8+l9) = vol_lped11(1,l1+l2+l3+l4+l5+l6+l7+l8) + vol9(1,:);

% minor modification to look more real

vol_lped11(2,646) = -56 ;
vol_lped11(2,1801) = -54 ;
vol_lped11(2,1891) = -58 ;
vol_lped11(2,1966) = -62 ;
vol_lped11(2,2066) = -64 ;
vol_lped11(2,2266) = -65 ;
vol_lped11(2,2466) = -65 ;
vol_lped11(2,2866) = -65 ;
vol_lped11(2,3029) = -60 ;
vol_lped11(2,3823) = -55 ;

fprintf('L.Pe.D11 Pattern Completed.\n');

%% plot of lped11

vol_lped11(2,3329) = -60 ;

plot(vol_lped11(1,:),vol_lped11(2,:),'k');
box off
axis off
h=gca; 
h.XAxis.TickLength = [0 0];
h.YAxis.TickLength = [0 0];
set(gcf,'Position',[200 200 1200 600]);
xticks('auto');

%% Functions

function [vol_series,len] = generate_pattern (DT, NUM, steps, spike)
    spikes_arr = rand_spike(NUM);
    stat = tabulate (spikes_arr);
    many = round (stat(:,2),0 );
    total_steps = sum ( steps .* (many') );
    seg_point = ones(1,NUM-1);
    vol_series = zeros (2,total_steps);
    vol_series(1,:) = (1:total_steps) * DT;
    for i = 1:NUM
        flag = spikes_arr(i);
        s_add = spike( flag, 1:steps(flag));
        start_point = seg_point(i);
        seg_point (i+1) = seg_point(i) + steps(flag) ; 
        vol_series(2,start_point:seg_point(i+1)-1) = s_add; 
    end     
    len = length(vol_series);
end

function rand_spike = rand_spike( num )
    rand_spike = zeros(1,num);
    for i = 1:num
        x = round ( rand, 3 );
        x = x * 10^3 ;
        rand_spike(i) = round ( mod(x,3) + 2 , 0);
    end
end
