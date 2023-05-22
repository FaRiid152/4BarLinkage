clear all; close all; clc;

fig = uifigure('Name','Kinematic Analysis of Four Bar Linkage');
pnl = uipanel(fig);
pnl.Position= [340 20 200 380];
edt1 = uieditfield(pnl,"numeric","Position",[41 165 140 22]);
edt2 = uieditfield(pnl,"numeric","Position",[41 140 140 22]);
edt3 = uieditfield(pnl,"numeric","Position",[41 115 140 22]);
edt4 = uieditfield(pnl,"numeric","Position",[41 90   140 22]);

label1 = uilabel(pnl,'Text','L_1','Interpreter','tex','Position',[11 165 140 22]);
label2 = uilabel(pnl,'Text','L_2','Interpreter','tex','Position',[11 140 140 22]);
label3 = uilabel(pnl,'Text','L_3','Interpreter','tex','Position',[11 115 140 22]);
label4 = uilabel(pnl,'Text','L_4','Interpreter','tex','Position',[11 90 140 22]);

p = uipanel(fig,'Position',[10 20 320 380]);
ax = uiaxes(p,'Position',[10 10 290 370]);
b = uibutton(pnl,"Text","Calculate",'Position',[41 65 140 22], ...
                          "ButtonPushedFcn", @(src,event) plotButtonPushed(ax,[edt1.Value edt2.Value edt3.Value  edt4.Value]));
axis(ax,[-10 10 -10 10])
grid(ax,"on")


function plotButtonPushed(ax,L)
options = optimoptions('fsolve','Display','off');
sol = fsolve(@(theta)myKinematics(theta,L),[1 2],options);
plot(ax,[0 L(1)*cos(pi/4)],[0 L(1)*sin(pi/4)])
hold(ax,'on')
plot(ax,[L(1)*cos(pi/4) L(2)*cos(sol(1))],[L(1)*sin(pi/4) L(2)*sin(sol(1))])
plot(ax,[L(2)*cos(sol(1)) L(3)*cos(sol(2))],[ L(2)*sin(sol(1)) L(3)*sin(sol(2))])
plot(ax,[L(3)*cos(sol(2)) L(4)],[L(3)*sin(sol(2)) 0])
hold(ax,'off')
end

function outputArg = myKinematics(theta,L)
%myK contains kinematics of a 4 bar linkages
%   Detailed explanation goes here
alpha =  pi/4;
beta = 0;
outputArg = [L(1)*cos(alpha)+L(2)*cos(theta(1))+L(3)*cos(theta(2))-L(4)*cos(beta);
                           L(1)*sin(alpha)+L(2)*sin(theta(1))+L(3)*sin(theta(2))-L(4)*sin(beta)];

end