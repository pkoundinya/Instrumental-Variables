%  This subroutene forms the Z matrix from the input x obtained from the
%  simulation.

%% Forming the Z matrix
N2=length(x);
rowcount=1;
for tstep=lowindex:N2

%        
         Za(rowcount,[1:na])=-x(tstep-[1:na]);
         Zb(rowcount,[1:nb+1])=u(tstep+1-[1:na]);

%     
 Z=[Za,Zb];
X(rowcount)=x(tstep);
rowcount=rowcount+1;
end
Thetaiv4 = (inv(Z'*Phi))*Z'*Y';

% num =
% den=
% ysim=filter(num,den,u)

%add psudo inverse