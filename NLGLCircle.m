function [psidot,s] = NLGLCircle(O, r, p, psi, L, va, s)

% % Wi = [0, 0];
% % Wii = [300, 300];
% % p = [100, 0];
% % psi = 0;
% % del = 50;
% % va = 15;
% % k = 0.5;
% % Rmin = 3*va;
% % vw = 0;
% % psiw = 0;


[xout,yout] = circcirc(O(1), O(2), r, p(1), p(2), L);
point1 = [xout(1), yout(1)];
point2 = [xout(2), yout(2)];

if pdist([point1;s]) < pdist([point2;s])
    s = point1;
else
    s = point2;
end

%plot(s(1),s(2),'gx')
%hold on

theta = atan2d(s(2) - p(2), s(1) - p(1));
theta = theta + (theta < 0)*360;
eta = theta - psi;
u = (2*(va^2)*sind(eta));
psidot = u/va;


