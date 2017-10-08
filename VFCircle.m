function psidot = VFCircle(O, r, p, psi, va, alpha, k, kappa)

d = pdist([p;O]);
theta = atan2d(p(2)-O(2), p(1)-O(1));
term1 = (va/(alpha*d))*sind(psi - theta);
term2 = ((k*va*pi)/(3*r*alpha))*cosd(psi - theta);

  psid = theta - 180 + asind(r/d);
  %psid = theta - (90 + atand(kappa*(d-r)));
  psic= psid;
  


%  if d > 2*r
%      psid = theta - 180 + asind(r/d);
%      psic = psid + term1;
%  else
%      psid = theta - 90 - 60*((d-r)/r);
%      psic = psid - term1 -term2;
%  end

%psi = psi + (psi < 0)*360;
psidot = k*(psic-psi);

