
# so far the best BTC analysis tool (2026/Q2)
# written in Febr, 2026.
# data point source: coinmarketcap.com > BTC > all > cvs.

#=================
# Manual, ecco:
#=================

#
# 1. run BTC_init
# 2. run basic_analysis (this one)
# 3. run reconstruct
# 4. run analyze_reconstructed_1
# 5. runa analyze_4x4yrs, to see the max_possible_gain = f(years_of_hodling))

#=================
# plotting part of the 4y curves
#=================


init_titles;

plot_till = Xmax_4_marg; # definhed in BTC_init.m

#=================
# plotting bigger part of the ORIG 4y curves
#=================

plot_till = Xmax_4_marg;

# btc-4y brought in line to last 4y:
x1 = btcM(1, 1:plot_till);
x2 = btcM(2, 1:plot_till);
x3 = btcM(3, 1:plot_till);
x4 = btcM(4, 1:plot_till);

# now the hamming filtered 4y:
y2 = yyyM(1, 1:plot_till);
y2 = yyyM(2, 1:plot_till);
y3 = yyyM(3, 1:plot_till);
y4 = yyyM(4, 1:plot_till);

# btc-4y brought in line to last 4y:
# d stands for Delayed (Y2-Y3-Y4)
plot_till = 250
x1d = btcM11(1, 1:plot_till);
x2d = btcM11(2, 1:plot_till);
x3d = btcM11(3, 1:plot_till);
x4d = btcM11(4, 1:plot_till);

# now the hamming filtered 4y:
y1d = yyyM11(1, 1:plot_till);
y2d = yyyM11(2, 1:plot_till);
y3d = yyyM11(3, 1:plot_till);
y4d = yyyM11(4, 1:plot_till);


#=============================
# Absolute 4Y(208) curves
#=============================

figure (6)
clf

subplot(421)
plot (x1d, 'r')
hold on
plot (y1d, 'c')
grid on
title(title_2011_2015)
xlabel ('week Nr.')
ylabel ('price [$]')

subplot(423)
plot (x2d, 'b')
hold on
plot (y2d, 'c')
grid on
title(title_2015_2019)
xlabel ('week Nr.')
ylabel ('price [$]')


subplot(425)
plot (x3d, 'g')
hold on
plot (y3d, 'c')
grid on
title(title_2019_2023)
xlabel ('week Nr.')
ylabel ('price [$]')


subplot(427)
plot (x4d, 'k')
hold on
plot (y4d, 'c')
grid on
title(title_2023_2027)
xlabel ('week Nr.')
ylabel ('price [$]')

#=============================
# NORMALIZED 4Y(208) curves
#=============================

plot_from = 1;

subplot(422)
plot (x1d/x1d(plot_from), 'r')
hold on
plot (y1d/y1d(plot_from), 'c')
grid on
title(title_2011_2015)
xlabel ('week Nr.')
ylabel ('Relative price')

subplot(424)
plot (x2d/x2d(plot_from), 'b')
hold on
plot (y2d/y2d(plot_from), 'c')
grid on
title(title_2015_2019)
xlabel ('week Nr.')
ylabel ('Relative price')


subplot(426)
plot (x3d/x3d(plot_from), 'g')
hold on
plot (y3d/y3d(plot_from), 'c')
grid on
title(title_2019_2023)
xlabel ('week Nr.')
ylabel ('Relative price')


subplot(428)
plot (x4d/x4d(plot_from), 'k')
hold on
plot (y4d/y4d(plot_from), 'c')
grid on
title(title_2023_2027)
xlabel ('week Nr.')
ylabel ('Relative price')


#=============================
# Absolute 4Y(200) BTC-curves
#=============================

figure (7)
clf
plot_from = 1;
plot_till = 200;

subplot(421)
plot (x1d(plot_from:plot_till), 'r')
hold on
plot (y1d(plot_from:plot_till), 'c')
grid on
title(title_2011_2014)
xlabel ('week Nr.')
ylabel ('price [$]')

subplot(423)
plot (x2d(plot_from:plot_till), 'g')
hold on
plot (y2d(plot_from:plot_till), 'c')
grid on
title(title_2015_2018)
xlabel ('week Nr.')
ylabel ('price [$]')


subplot(425)
plot (x3d(plot_from:plot_till), 'b')
hold on
plot (y3d(plot_from:plot_till), 'c')
grid on
title(title_2019_2022)
xlabel ('week Nr.')
ylabel ('price [$]')


subplot(427)
plot (x4d(plot_from:plot_till), 'k')
hold on
plot (y4d(plot_from:plot_till), 'c')
grid on
title(title_2023_2026)
xlabel ('week Nr.')
ylabel ('price [$]')

#=============================
# NORMALIZED Y1-Y4 curves
#=============================

figure (7)
plot_from = 1;
plot_till = 200;

subplot(422)
plot (x1d(plot_from:plot_till)/x1d(plot_from), 'r')
#hold on
#plot (y1, 'c')
grid on
title(title_2011_2014)
xlabel ('week Nr.')
ylabel ('Relative price')

subplot(424)
plot (x2d(plot_from:plot_till)/x2d(plot_from), 'g')
#hold on
#plot (y2, 'c')
grid on
title(title_2015_2018)
xlabel ('week Nr.')
ylabel ('Relative price')

subplot(426)
plot (x3d(plot_from:plot_till)/x3d(plot_from), 'b')
#hold on
#plot (y3, 'c')
grid on
title(title_2019_2022)
xlabel ('week Nr.')
ylabel ('Relative price')

subplot(428)
plot (x4d(plot_from:plot_till)/x4d(plot_from), 'k')
#hold on
#plot (y4, 'c')
grid on
title(title_2023_2026)
xlabel ('week Nr.')
ylabel ('Relative price')

#=============================
# NORMALIZED Y1-Y3 curves
#=============================

figure (8)
plot_from = 1;
plot_till = 200;

subplot(221)
plot (x1d(plot_from:plot_till)/x1d(plot_from), 'r')
#hold on
#plot (y1, 'c')
grid on
title(title_2011_2014)
xlabel ('week Nr.')
ylabel ('Relative price')

subplot(223)
plot (x2d(plot_from:plot_till)/x2d(plot_from), 'g')
#hold on
#plot (y2, 'c')
grid on
title(title_2015_2018)
xlabel ('week Nr.')
ylabel ('Relative price')

subplot(222)
plot (x3d(plot_from:plot_till)/x3d(plot_from), 'b')
#hold on
#plot (y3, 'c')
grid on
title(title_2019_2022)
xlabel ('week Nr.')
ylabel ('Relative price')

subplot(224)
plot (x4d(plot_from:plot_till)/x4d(plot_from), 'k')
#hold on
#plot (y4, 'c')
grid on
title(title_2023_2026)
xlabel ('week Nr.')
ylabel ('Relative price')
#=============================


#=============================
# ABS PRICE Y1-Y3 curves
#=============================

figure (10)
plot_from = 1;
plot_till = 200;

subplot(221)
plot (x1d(plot_from:plot_till), 'r')
#hold on
#plot (y1, 'c')
grid on
title(title_2011_2014)
xlabel ('week Nr.')
ylabel (' price')

subplot(223)
plot (x2d(plot_from:plot_till), 'g')
#hold on
#plot (y2, 'c')
grid on
title(title_2015_2018)
xlabel ('week Nr.')
ylabel (' price')

subplot(222)
plot (x3d(plot_from:plot_till), 'b')
#hold on
#plot (y3, 'c')
grid on
title(title_2019_2022)
xlabel ('week Nr.')
ylabel (' price')

subplot(224)
plot (x4d(plot_from:plot_till), 'k')
#hold on
#plot (y4, 'c')
grid on
title(title_2023_2026)
xlabel ('week Nr.')
ylabel (' price')
#=============================




#=============================

figure (9)
plot_from = 1;
plot_till = 200;

subplot(221)
semilogy (x1d(plot_from:plot_till)/x1d(plot_from), 'r')
#hold on
#plot (y1, 'c')
grid on
title(title_2011_2014)
xlabel ('week Nr.')
ylabel ('Relative price')

subplot(223)
semilogy (x2d(plot_from:plot_till)/x2d(plot_from), 'g')
#hold on
#plot (y2, 'c')
grid on
title(title_2015_2018)
xlabel ('week Nr.')
ylabel ('Relative price')

subplot(222)
semilogy (x3d(plot_from:plot_till)/x3d(plot_from), 'b')
#hold on
#plot (y3, 'c')
grid on
title(title_2019_2022)
xlabel ('week Nr.')
ylabel ('Relative price')

subplot(224)
semilogy (x4d(plot_from:plot_till)/x4d(plot_from), 'k')
#hold on
#plot (y4, 'c')
grid on
title(title_2023_2026)
xlabel ('week Nr.')
ylabel ('Relative price')
#=============================










