
# reconstructing a continuous, partially normalized signal
# run "basic_analysis" before

# the 4 frames are stored in btcM11

n1d = btcM11(1, :)/ btcM11(1, 1);
n2d = btcM11(2, :)/ btcM11(2, 1);
n3d = btcM11(3, :)/ btcM11(3, 1);
n4d = btcM11(4, :)/ btcM11(4, 1);

# normalizing, ie. tilting down-wards the 4 curves
# Y = linspace (START, END, N)
N = 204 # see the main routing cutting the frames

# last elements of the curves:
N1 = n1d(N)
N2 = n2d(N)
N3 = n3d(N)
N4 = n4d(N)

# trend as a linear between first and last element
a1 = linspace(1,N1,  N);
a2 = linspace(1,N2,  N);
a3 = linspace(1,N3,  N);
a4 = linspace(1,N4,  N);

# subtracting the trend:
nn1d = n1d(1:N) ./ a1;
nn2d = n2d(1:N) ./ a2;
nn3d = n3d(1:N) ./ a3;
nn4d = n4d(1:N) ./ a4;


# dividing by the max values:

if 0
  M1 = max(nn1d)
  M2 = max(nn2d)
  M3 = max(nn3d)
  M4 = max(nn4d)

  nn1d = nn1d(1:N)./M1;
  nn2d = nn2d(1:N)./M2;
  nn3d = nn3d(1:N)./M3;
  nn4d = nn4d(1:N)./M4;

end #if 0

# conCAT

 ooo = ones (1,200);
 Y = horzcat(nn1d, nn2d, nn3d, nn4d, ooo);

# ===

figure(90)

subplot(411)
plot(n1d,'r')
hold on
plot(nn1d,'k')
grid on

subplot(412)
plot(n2d,'g')
hold on
plot(nn2d,'k')
grid on

subplot(413)
plot(n3d,'b')
hold on
plot(nn3d,'k')
grid on

subplot(414)
plot(n4d,'k')
hold on
plot(nn4d,'k')
grid on


figure(91)

subplot(411)
plot(nn1d)
grid on

subplot(412)
plot(nn2d)
grid on

subplot(413)
plot(nn3d)
grid on

subplot(414)
plot(nn4d)
grid on

 figure(92)
 subplot(311)
 plot(Y)

 # run FFT_Norm_1 now.
