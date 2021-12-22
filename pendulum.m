%Phong Thanh Trinh
L = 1; tf = 10; fps = 20; theta0 = pi/6; omega0 = 0; g = 9.81;

f = @(t,u) [u(2); (-g/L)*sin(u(1))];
t = 0:1.001/fps:tf; 
u0 = [theta0;omega0];
[T,U] = ode45(f,t,u0);

f2 = theta0*cos(sqrt(g/L)*t) + omega0*sqrt(L/g)*sin(sqrt(g/L)*t);

x = L*sin(U(:,1)); 
y = -L*cos(U(:,1));
x2 = L*sin(f2);
y2 = -L*cos(f2);

for i = 1:length(t)
    time = i/20;
    plot(0, 0,'r.','MarkerSize',20);
    plot(0, 0,'b.','MarkerSize',20);
    hold on;
    plot([0;x(i)],[0;y(i)],'b-');
    plot(x(i),y(i),'b.','MarkerSize',40);

    plot([0;x2(i)],[0;y2(i)],'r-');
    plot(x2(i),y2(i),'r.','MarkerSize',40);
    axis equal;
    xlim([-2*L,2*L]);
    ylim([-2*L,2*L]);
    grid on;
   title(['Pendulum (Blue) vs Approximate (Red), t = ',num2str(time),'s']);
    hold off;

    M(i) = getframe(gcf);
   
    
end
