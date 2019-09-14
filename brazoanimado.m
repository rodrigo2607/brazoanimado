close all

clc

 promt = 'introduzca el valor (grados) de la primera articulacion:';
 theta1_deg = input(promt);
 theta1_Rad = deg2rad(theta1_deg);
 
 promt = 'introduzca el valor (grados) de la segunda articulacion:';
 theta2_deg = input(promt);
 theta2_Rad = deg2rad(theta2_deg);
 

    
 for theta1_Rad=0:0.1:theta1_Rad
clf  
PrintAxis();
p1=[0;0;0];
L1=8;
L2=4;

% theta1_deg = 30;
% theta1_Rad = deg2rad(theta1_deg);
% theta2_deg = -15;
% theta2_Rad = deg2rad(theta2_deg);

TRz1 = [cos(theta1_Rad) -sin(theta1_Rad) 0 0;sin(theta1_Rad) cos(theta1_Rad) 0 0;0 0 1 0;0 0 0 1];
TRx1 = [1 0 0 L1;0 1 0 0; 0 0 1 0; 0 0 0 1];
T1=TRz1*TRx1;
p2=T1(1:3,4);
v1x=TRz1(1:3,1);
v1y=TRz1(1:3,2);
line([p1(1) p2(1)],[p1(2) p2(2)],[p1(2) p2(2)],'color',[0 0 0],'linewidth',5)%primer eslabon del brazo
line([p1(1) v1x(1)],[p1(2) v1x(2)],[p1(2) v1x(2)],'color',[1 0 0],'linewidth',5)%eje x1 pequeño
line([p1(1) v1y(1)],[p1(2) v1y(2)],[p1(2) v1y(2)],'color',[0 1 0],'linewidth',5)%eje y1 pequeño
pause(0.1);
 end
 for theta2_Rad=0:-0.1:theta2_Rad
     clf
     PrintAxis();

     
TRz2 = [cos(theta2_Rad) -sin(theta2_Rad) 0 0;sin(theta2_Rad) cos(theta2_Rad) 0 0;0 0 1 0;0 0 0 1];
TRx2 = [1 0 0 L2;0 1 0 0; 0 0 1 0; 0 0 0 1];
T2=TRz2*TRx2;



Tf=T1*T2;
p3=Tf(1:3,4);
v3x=p3+Tf(1:3,1);
v3y=p3+Tf(1:3,2);
v1x=TRz1(1:3,1);
v1y=TRz1(1:3,2);

line([p2(1) p3(1)],[p2(2) p3(2)],[p2(2) p3(2)],'color',[0.6 0 0.8],'linewidth',5)%segundo eslabon del brazo
line([p1(1) p2(1)],[p1(2) p2(2)],[p1(2) p2(2)],'color',[0 0 0],'linewidth',5)%primer eslabon del brazo
line([p1(1) v1x(1)],[p1(2) v1x(2)],[p1(2) v1x(2)],'color',[1 0 0],'linewidth',5)%eje x1 pequeño
line([p1(1) v1y(1)],[p1(2) v1y(2)],[p1(2) v1y(2)],'color',[0 1 0],'linewidth',5)%eje y1 pequeño

v2x=p2+T1(1:3,1);
v2y=p2+T1(1:3,2);
line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(2) v2x(2)],'color',[1 0 0],'linewidth',5)%eje x2 pequeño
line([p2(1) v2y(1)],[p2(2) v2y(2)],[p2(2) v2y(2)],'color',[0 1 0],'linewidth',5)%eje y2 pequeño
line([p3(1) v3x(1)],[p3(2) v3x(2)],[p3(2) v3x(2)],'color',[1 0 0],'linewidth',5)%eje x3 pequeño
line([p3(1) v3y(1)],[p3(2) v3y(2)],[p3(2) v3y(2)],'color',[0 1 0],'linewidth',5)%eje y3 pequeño

pause(0.1);
 end