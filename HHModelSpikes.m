
% clc; clear;

%% Constants & Initialize

Cm=0.01; % Membrane Capcitance uF/cm^2
dt=0.04; % Time Step ms
t=0:dt:60; %Time Array ms
I=0.1; %External Current Applied
ENa=55.17; % mv Na reversal potential
EK=-72.14; % mv K reversal potential
El=-49.42; % mv Leakage reversal potential
gbarNa=1.2; % mS/cm^2 Na conductance
gbarK=0.36; % mS/cm^2 K conductance
gbarl=0.003; % mS/cm^2 Leakage conductance

V = zeros(1,length(t)); % Initialize empty arrays
m = zeros(1,length(t));
n = zeros(1,length(t));
h = zeros(1,length(t));
V(1)=-66; % Initial Membrane voltage
m(1)=am(V(1))/(am(V(1))+bm(V(1))); % Initial m-value
n(1)=an(V(1))/(an(V(1))+bn(V(1))); % Initial n-value
h(1)=ah(V(1))/(ah(V(1))+bh(V(1))); % Initial h-value

%% Calculate voltages during action potentials

for i=1:length(t)-1

     %Euler method to find the next m/n/h value
     m(i+1)=m(i)+dt*((am(V(i))*(1-m(i)))-(bm(V(i))*m(i)));
     n(i+1)=n(i)+dt*((an(V(i))*(1-n(i)))-(bn(V(i))*n(i)));
     h(i+1)=h(i)+dt*((ah(V(i))*(1-h(i)))-(bh(V(i))*h(i)));
     gNa=gbarNa*m(i)^3*h(i);
     gK=gbarK*n(i)^4;
     gl=gbarl;

     INa=gNa*(V(i)-ENa);
     IK=gK*(V(i)-EK);
     Il=gl*(V(i)-El);

     %Euler method to find the next voltage value
     V(i+1)=V(i)+(dt)*((1/Cm)*(I-(INa+IK+Il)));

end

%Store variables for graphing later
FE=V;
% FEm=m;
% FEn=n;
% FEh=h;

%% Single spikes plot

% plot(t,FE);
% legend('Forward Euler');
% xlabel('Time (s)');
% ylabel('Voltage (mV)');
% title('Voltage Change for Hodgkin-Huxley Model');

% figure
% plot(t,FEn,'b',t,FEm,'g',t,FEh,'r');
% ylabel('Gaining Variables')
% xlabel('Time (s)')
% axis([0 5 0 1])

%% Store single spike

NUM_spikes = 4;
Int_FE = round (FE, 0);
ref = find ( Int_FE == -66 ); % initial voltage -66 mV as reference
% manually record time points that seperate the four spikes
ref_points = [];
ref_points(1) = 1;
ref_points(2) = 207;
ref_points(3) = 569;
ref_points(4) = 934;
ref_points(5) = 1299;
% record four spikes

steps = [];
for i = 1:4
    step = ref_points(i+1) - ref_points(i);
    steps(i) = step;
end
spike_1 = zeros(1,steps(1));
spike_2 = zeros(1,steps(2));
spike_3 = zeros(1,steps(3));
spike_4 = zeros(1,steps(4));

flag = 1;
long = 1:1:steps(flag); 
start = ref_points(flag);
for i = long
    spike_1(i) = FE(start);
    start = start + 1;
end

flag = 2;
long = 1:1:steps(flag); 
start = ref_points(flag);
for i = long
    spike_2(i) = FE(start);
    start = start + 1;
end

flag = 3;
long = 1:1:steps(flag); 
start = ref_points(flag);
for i = long
    spike_3(i) = FE(start);
    start = start + 1;
end

flag = 4;
long = 1:1:steps(flag);
start = ref_points(flag);
for i = long
    spike_4(i) = FE(start);
    start = start + 1;
end

fprintf('Single Spikes Consructed.\n');

%% plot single spike

% plot(spike_1);
% hold on
% plot(spike_2);
% hold on
% plot(spike_3);
% hold on
% plot(spike_4);
% legend


%% Basic Functions

function a=am(v) %Alpha for Variable m
 a=0.1*(v+35)/(1-exp(-(v+35)/10));
end
function b=bm(v) %Beta for variable m
b=4.0*exp(-0.0556*(v+60));
end
function a=an(v)%Alpha for variable n
a=0.01*(v+50)/(1-exp(-(v+50)/10));
end
function b=bn(v) %Beta for variable n
b=0.125*exp(-(v+60)/80);
end
function a=ah(v) %Alpha value for variable h
a=0.07*exp(-0.05*(v+60));
end
function b =bh(v) %beta value for variable h
b=1/(1+exp(-(0.1)*(v+30)));
end
