% Chebyshev Type-1 Low Pass Filter Design
clear all;
rp=1;% paramter governing the pass band attenuation in db (alpha-p)
rs=20;%paramter governing the stop band attenuation in db (alpha-s)
wp=0.2*pi;% paramater governing the pass band frequency in radians
ws=0.3*pi;% paramater governing the stop band frequency in radians
[n,wn] = cheb1ord(wp/pi,ws/pi,rp,rs)% Function which is  uses the chebyshev filter design formula to calculate value for n and cutoff frequency wn
[b,a] = cheby1(n,rp,wn)% Function which is  uses the chebyshev filter design formula to calculate value for a and b ie the minor axis and major axis calculation
% displaying order of filter
disp(n);
% displaying cut off frequency of filter(pass band frequency)
disp(wn);
%defining the axis for the plot
w=0:.01:pi;
% Frequency response of analog filters 
[h,ph]=freqz(b,a,w);% returns the complex frequency response(h) also the phase response(ph) of the analog filter specified by the coefficient vectors b and a, evaluated at the angular frequencies w.
% Calculating the magnitude in terms of db for plotting magnitude response
m=20*log10(abs(h));
% Calculating angle in radians for plotting phase spectrum
an=angle(h);
%Plotting the magnitude spectrum in db 
%first we divide the entire plain into two plains where in the firstplain ie the top half would be dedicated for the magnitude spectrum as depicted below in the function subplot
subplot (2,1,1);
plot(ph/pi,m);%Function to plot the graph( x-axis:radians value of w in radian ,y:axis value of m in db)
grid; %Activating horizontal and vertical axis
ylabel('gain in db');
xlabel('normalised frequency');
%Plotting Phase Spectrum in radians
%first we divide the entire plain into two plains where in the second plain ie the bottom half would be dedicated for the Phase spectrum as depicted below in the function subplot
subplot (2,1,2);
plot(ph/pi,an);%Function to plot the graph( x-axis:radians value of w in radian ,y:axis value of an in radian)
grid;%Activating horizontal and vertical axis
ylabel('phase in radians');
xlabel('normalised frequency');
