clc; 
%close all;  
clear;

O = [0 0]; % Centre of circle
r = 100; % radius of path circle

p = [0,125]; % current position of drone
pinit = p;
pos = p; % array to store all positions over time
%goalRadius = 5; % radius within which waypoint is considered reached
%heading = [0, 90, 180, 270];
psi = 0; % heading angle of drone


%del = 50; % "look-ahead" distance
va = 15; % UAV airspeed
%k = 0.5; % P Gain
%tau = 45;
%q22 = 1;
alphas = [1, 2, 3, 5, 10];
alpha = 1;
k = 1;
kappa = 1;


    
figure(1)
drawCircle(O(1), O(2), r);
xlim([-150 150])
ylim([-150 150])
hold on
plot(pinit(1),pinit(2),'ro')
hold on

% i = 1;
% while(i<6)
%     alpha = alphas(i);
    j = 1;
    while(j<3000)
%     if(jj>2250)
%         p, psi
%     end
    %plot(pos(:,1), pos(:,2),'r')
    %hold on
        psidot = VFCircle(O, r, p, psi, va, alpha, k, kappa);
        [psi, p] = updatePosition(p(1), p(2), va, psi, psidot, 0.01);
        pos = [pos;p];
        j = j+1;
    end
    plot(pos(:,1), pos(:,2))
    hold on
%     pos = pinit;
%     p = pinit;
%     i = i+1;
% end


% 
%  plot(robotLocation(:,1), robotLocation(:,2),'k--d')
%  xlim([0 25])
%  ylim([0 25])