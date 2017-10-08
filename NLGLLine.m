function psidot = NLGLLine(slope, incp, p, psi, L, va)

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


[xout,yout] = linecirc(slope, incp, p(1), p(2), L);
if xout(1)>=xout(2)
    xt = xout(1);
    yt = yout(1);
else
    xt = xout(2);
    yt = yout(2);
end
s = [xt,yt];

theta = atan2d(yt - p(2), xt - p(1));
eta = theta - psi;
u = (2*(va^2)*sind(eta));
psidot = u/va;


