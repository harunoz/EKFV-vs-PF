f='x(1,:)/2+25*x(1,:)./(1+x(1,:).^2)+8*cos(1.2*t)';
h='x(1,:).^2/20';
m=nl(f,h,[1 0 1 0]);
m.fs=1;
m.x0=10;
m.px0=10;  % P0=cov(x0)
m.pv=10;  % Q=cov(v)
m.pe=1;   % R=cov(e)


z= simulate (m,50);
npf=m;
npf.pe=10*cov(m.pe);

zekf=ekf(m,z);
zpf=pf(npf,z,'Np' ,1000,'animate','on','sampling','simple');%Particle Filter.
xplot (z,zpf ,zekf ,'conf',90,'view','cont')



