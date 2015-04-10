%% Designing the Pre filter F(z^-1)
% This subroutine is generating the Prefilter used for IV4 estimation
v1=y-x;
rowcount=1;
% for tstep=lowindex:N
%     
%         Ba(rowcount,[1:r])=v1(tstep-[1:r]);
%     
%     rowcount=rowcount+1;
% end
for tstep=lowindex:N
    for ttindex=1:r
        Ba(rowcount,ttindex)=v1(tstep-ttindex);
    end
    rowcount=rowcount+1;
end
M=eye(N-lowindex+1)-(Phi/(Phi'*Phi))*Phi'; % 
D=Ba'*M*Ba;
Psihat=inv(D)*Ba'*M*(Y-bias)';
numF=[Psihat(1) Psihat(2) Psihat(3)]; % these are the coefficients of the filter.
% num1=[1];
denF=[1];
uf=filter(numF,denF,u);
Yf=filter(numF,denF,Y');

