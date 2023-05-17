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

b = uibutton(pnl,"Text","Calculate",'Position',[41 65 140 22], ...
                          "ButtonPushedFcn", @(src,event) plotButtonPushed(ax));



function plotButtonPushed(ax)
@(L)Simulation_4BarLinkage([edt1.Value edt2.Value edt3.Value edt4.Value]);
x = linspace(0,2*pi,100);
y = sin(x);
plot(ax,x,y)
end