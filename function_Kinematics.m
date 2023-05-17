function outputArg = myK(theta,alpha,beta,L)
%myK contains kinematics of a 4 bar linkages
%   Detailed explanation goes here
outputArg = [L(2)*cos(beta)+L(3)*cos(theta(3))+L(4)*cos(theta(4))-L(1)*cos(alpha);
                           L(2)*sin(beta)+L(3)*sin(theta(3))+L(4)*sin(theta(4))-L(1)*sin(alpha)];

end