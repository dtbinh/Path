clc; 
close all;  
clear;

O = [0 0]; % Centre of circle
r = 100; % radius of path circle

%working pair: p = [-50, 125] and psi = 180
p = [-50, 125]; % current position of drone
pinit = p;
pos = p; % array to store all positions over time
psi = -90; % heading angle of drone
L = 60;
va = 15; % UAV airspeed

figure(1)
drawCircle(O(1), O(2), r);
xlim([-150 150])
ylim([-150 150])
hold on
plot(pinit(1),pinit(2),'ro')
hold on

[xout,yout] = circcirc(O(1), O(2), r, p(1), p(2), L);
thetatopoint1 = atan2d(yout(1)-p(2), xout(1)-p(1)); 
thetatopoint1 = thetatopoint1 + (thetatopoint1 < 0)*360;
thetatopoint1 = thetatopoint1 - psi;
thetatopoint2 = atan2d(yout(2)-p(2), xout(2)-p(1));
thetatopoint2 = thetatopoint2 + (thetatopoint2 < 0)*360;
thetatopoint2 = thetatopoint2 - psi;

if thetatopoint1 < thetatopoint2
    xt = xout(1);
    yt = yout(1);
else
    xt = xout(2);
    yt = yout(2);
end
s = [xt,yt];

jj = 1;
while(jj<4000)
    
    [psidot,s] = NLGLCircle(O, r, p, psi, L, va, s);
%     if psidotold ~= 0
%         if abs(psidotold-psidot) > 5
%             p
%         end
%     end
    %if(jj>1300)
     %   p
    %end
    %psidotold = psidot;
    %s = [s; snew];
    [psi, p] = updatePosition(p(1), p(2), va, psi, psidot, 0.01);
    %plot(p(1), p(2), 'rx');
    pos = [pos;p];
    jj = jj+1;
end


%xlim([0 400])
%ylim([-100 400])
plot(pos(:,1), pos(:,2),'r')
hold on
%plot(s(:,1),s(:,2),'gx')
%hold on
