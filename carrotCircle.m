function psidot = carrotCircle(O, r, p, psi, del, va, k, Rmin, vw, psiw)

%  O = [0 0];
%  r = 100;
%  p = [0,100];
%  psi = 180;
%  del = 20;
%  va = 15;
%  k = 0.8;

d = pdist([O;p])-r;
theta = atan2d(p(2)-O(2), p(1)-O(1));

xt = r*cosd(theta+del);
yt = r*sind(theta+del);
s = [xt,yt];

yc = yt-p(2);
xc = xt-p(1);

%psid = myatan2d(yc, xc);
psid = atan2d(yc, xc);
%psid = psid + (psid < 0)*360;

psidot = k*(psid-psi);

u = psidot*va;