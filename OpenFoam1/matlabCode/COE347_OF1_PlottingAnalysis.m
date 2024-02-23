
%Juenger Openfoam Assignment 1 Analysis Code

clear
clc

data=importdata("nu0004460.19.csv");
data=data.data;

x=data(:,5);
y=data(:,6);
u=data(:,1);
v=data(:,2);


L=0.1;
n=81;


for i=1:n-1
    for j=1:n
        if i==1
            jump=0;
        else
            jump=(n*i);
            U(i,j)=u(jump+j);
            V(i,j)=v(jump+j);
        end

    end
end



X=linspace(0,1,n);
Y=linspace(0,1,n-1);


%%


%streamslice(X,Y,U,V);
surf(X,Y,U);
xlim([0,1]);
ylim([0,1]);
grid on
grid minor
colormap("jet");
colorbar
title("Lid Driven Cavity | Re=224.2 | 80x80 size| contour of u")
xlabel('$\tilde{x}$', 'Interpreter','latex');
ylabel('$\tilde{y}$', 'Interpreter','latex');


%%

hold on
uslice=U(:,40);
vslice=V(:,40);
plot(uslice,Y,"linewidth",3,"color","b");
dudy=shear(Y,uslice);
%plot(dudy(:,1),Y,"linewidth",1.2,"color","r");
%plot(dudy(:,1),Y,"linewidth",1.2,"color","r")

grid on
grid minor
title("Re=224.2 | 80x80 size | Slice of u vs y at x=0.5")
xlabel("u");
ylabel('$\tilde{y}$', 'Interpreter','latex');
legend("Solution","Polynomial Fit");
%xlim([0 ,1]);
%%

for k=1:n
    fit=shear(Y,U(:,k));
    tau(k)=fit(end,2);

end
force=trapz(X,tau);
hold on

plot(X,tau,"linewidth",1.2,"color","r");

grid on
grid minor
title("Re=224.2 | 80x80size | \tau vs x for y=1 ")
xlabel('$\tilde{x}$', 'Interpreter','latex');
ylabel("\tau","FontSize",16);
%legend("Solution","Polynomial Fit");

%%
%du/dy shear using polynomial fit and analytical derivative 

function dudy=shear(y,u)

    p=polyfit(y(end-10:end),u(end-10:end),4);
    fit=(p(1)*(y.^4))+(p(2)*(y.^3))+(p(3)*(y.^2))+(p(4)*(y))+p(5);

    %derivative
    fitp=(4*p(1)*(y.^3))+(3*p(2)*(y.^2))+(2*p(3)*(y))+p(4);
    dudy=[fit;fitp]';
end






