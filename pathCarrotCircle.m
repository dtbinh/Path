clc; 
close all;  
clear;

O = [0 0]; % Centre of circle
r = 100; % radius of path circle
p = [-50,125]; % current position of drone
%p = [-50,125];
pinit = p;
pos = p; % array to store all positions over time
%goalRadius = 5; % radius within which waypoint is considered reached
%headings = [0, 90, 180, 270];
psi = 0; % heading angle of drone
dels = [8, 10, 20, 50];
%del = 20; % "look-ahead" angle in degrees
va = 15; % UAV airspeed
k = 0.8; % P Gain
Rmin = 0; %3*va; % Minimum turning radius
vw = 0; % Wind Velocity
psiw = 0; % Wind direction

figure(1)
drawCircle(O(1), O(2), r);
xlim([-150 150])
ylim([-150 150])
hold on
plot(pos(1,1),pos(1,2),'ro')

i=1;
while(i<5)
    del = dels(i);
    jj = 1;
    if i == 4
        limit = 3550;
    else
        limit = 3800
    end
    while(jj<limit)
    %plot(pos(:,1), pos(:,2),'r')
    %hold on
%     if(jj > 2250)
%          p, psi
%      end
        psidot = carrotCircle(O, r, p, psi, del, va, k, Rmin, vw, psiw);
        [psi, p] = updatePosition(p(1), p(2), va, psi, psidot, 0.01);
        pos = [pos;p];
        jj = jj+1;
    end
    plot(pos(:,1), pos(:,2))
    hold on
    pos = pinit;
    p = pinit;
    i = i+1;
end

% figure
% drawCircle(O(1), O(2), r);
% xlim([-150 550])
% ylim([-150 250])
% hold on


