f='x(1,:)/2+25*x(1,:)./(1+x(1,:).^2)+8*cos(1.2*t)';
h='x(1,:).^2/20';
m=nl(f,h,[1 0 1 0]);
m.fs=1;
m.x0=5;
m.px0=5;  % P0=cov(x0)
m.pv=10;  % Q=cov(v)
m.pe=1;   % R=cov(e)


z= simulate (m,10) ;
zekf=ekf(m,z);
zpf =pf(mpf ,z,'Np' ,1000,'sampling','simple');
xplot (z,zpf ,zekf ,'conf',90,'view','cont')



