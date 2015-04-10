%% Begining of the file

%             Author:  Pranav K(j)oundinya
%             Date : 10th October 2013.
%                    PSID:1175307
%                    System Identification
%                    MECE 7361
%                    HomeWorK4
%%   Input arguements 
%       na the numerator order.
%       nb the denominator order.
%       r the  filter order.
%       y is the output signal
%       u is the input signal
%       Ts is the sampling interval in seconds.
%       reruni is the number of reruns of the LSE.    

display('                   Pranav Koundinya');
display('                   PSID:1175307');
display('                   System Identification');
display('                   MECE 7361');
display('                   HomeWorK2');
display('                   Enter Inputs');


clear all
close all
clc
amp=0.3;        % Amplitude of the Noise
Ts=0.1;         % Sampling Interval in seconds
bias=0;          % bias in the calculation.
num=[0.5 0.1]; % numeratior for the initial transfer function.
den=[1 0.8 0.2]; % denominator for the final transfer function.
iPlant=tf(num,den,Ts,'variable','z^-1')% Initial Plant Transfer Function
num1=[1]; % numerator for the filter.
sim Signal % Simulates the Matlab SimulinK(j) BlocK(j) Diagram
%% The 4 steps of IV4
% Step1 to calculate RLSE
Koundinya_RLSE 
% Step2 To calculate Z and x
Koundinya_InstrumentalVariable 
% Step3 To calculate the Pre Filter
Koundinya_Prefilter 
% Step4 to calculate the Theta IV4
Koundinya_ThetaIV4 

%% Plotting the output 

plot(x,'b')
legend('Measured y','Estimated output x','Updated output after IV4')
 
%
figure(2)
hold 
grid 
w = linspace(0,pi); % time space to plot the frequency Response
h = freqz(numF,denF,w); % This is the frequeny response of the filter
plot(w,h)
 title('Koundinya Homework 4 Frequency Response of the prefilter')
ylabel('Magnitude response of prefilter')
xlabel('rad/sec')
%% END OF FILE