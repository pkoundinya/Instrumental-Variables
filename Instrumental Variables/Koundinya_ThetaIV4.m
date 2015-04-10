%% Theta Instrumental Variables;

% This subroutine calculates the ThetaIV4 for the  final estimate
Thetaiv4 = (inv(Z'*Phi))*Z'*Yf';


den=[1 Thetaiv4(1:na,1)'];
num=[Thetaiv4(na+1:N1)'];
PlantFinal=tf(num,den,Ts,'variable','z^-1')  %Final transfer fucntion of the plant 
display('The ThetaIV4 is:')

display(Thetaiv4)  
sim Signal


%% end of subroutine