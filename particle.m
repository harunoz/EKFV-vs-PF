m=exnl('robotic');

z=simulate(m,1000);
mpf=m;
mpf.pe=10*cov(m.pe); % Some dithering required
zekf=ekf(m,z);
zpf=pf(mpf,z,'k',1);
xplot(z,zpf,zekf,'conf',90,'view','cont')