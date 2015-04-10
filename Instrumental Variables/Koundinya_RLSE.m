%%              INPUT MODEL INFORMATION
% Specifying the Model Structure
% na=input('Enter Order of Denominator:')%2;               % order of the denominator, y(t-na)
% nb=input('Enter Order of numerator:')%1;               % order of the numerator,   u(t-nb)
% r=input('Enter Order of The Filter:')%12;                % order of the noise model/filter
na=2;
nb=1
r=4;
% Ts=0.1;             % Sampling Interval in seconds
% rerun=3;            % Number of Interations
% y=input('enter the output signal:');
% u=input('enter the input signal:');
%
%% Phi Matrix
%
% Obtaining the Dimensions for P
%

N=length(y);          % length of output vector; number of regressions
lowindex=r+1;                 % lower data point to start data collection
N1=na+nb+1;                 % number of colums P matrix.
%
% Building the P matrix
rowcount=1;
Theta=zeros(N1,1);  % initializing Theta to zero 
gama=1500;   % 
P=gama*eye(N1); % initial P matrix
I=eye(N1);
% phihat(j)(0)=0;
% phihat(j)(1)=0;


%% Building the Phi matrix

        % It is easy to build the P matrix or th Phi matrix(Capital
        % Phi) than calculating phi for each row.
plot(y,'r')
grid
hold
title('Koundinya Homework 4 Simulations for IV4')
ylabel('System Output')
xlabel('Sampling Interger')
for tstep=lowindex:N

%        
         Pa(rowcount,[1:na])=-y(tstep-[1:na]);
         Pb(rowcount,[1:nb+1])=u(tstep+1-[1:na]);

%     
 Phi=[Pa,Pb];
Y(rowcount)=y(tstep);
rowcount=rowcount+1;
end
%% RLSE
Nhat=length(Y);
  for j=1:Nhat;

    phihat(j,:)=Phi(j,:);
    K=(P*phihat(j,:)')/((phihat(j,:)*P*phihat(j,:)')+1);
    Thetaupdate=Theta+(K*(Y(j)'-phihat(j,:)*Theta));
    Pupdate=(I-(K*phihat(j,:)))*P;
    P=Pupdate;
    Theta=Thetaupdate;   % First Theta update
%     Thetahat(j)=Theta;
  end
den=[1 Thetaupdate(1:na,1)'];      % model denominator

num=[Thetaupdate(na+1:N1)'];        % model numerator
plant1=tf(num,den,Ts,'variable','z^-1')
sim Signal
plot(x,'k')
% x1=filter(num2,den2,u);
% x=x1;
 