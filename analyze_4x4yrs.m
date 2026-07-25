
#========================
# "Enter-exit" map - 2D analysis
#========================

# analyze input  price vector and derive "enter-exit" map depicting gains/losses for a 4-year period
# tesing vector Y is derived in "reconstruct.m"
# but we will use the orig price vectors from "basic_analysis"
# --
# uses "btx_init"
# uses "basic analysis"
# uses "reconstruct"
# --
# 1st ver: Q1 2026.
# last change: umWeeks2Hodl = 200;
# you can run this script several times in order to get the 2D cuirves with different enter-exit curves,
# ... by adoptin the following variableS:
  # some BTC params
  #lastWeek2Buy = 800;
  #numWeeks2Hodl = 200;
  #  end

# =======================
# using normalized-tilted curves
# =======================
#ss = Y(1:end);
#ss = Y(208:end);
#ss = Y(416:end);
#ss = Y(624:end);


# =======================
# using the COMPLETE BTC price from 2010 kb
# =======================

analyze_eth = 0
recalc = 1 #  see decompose_again below

if analyze_eth
  from = 1; # skip the first part of the samples , ie. end of 2010 in case of BTC
  till = 585;
  ss = eth(from:till);

  # some Eth params
  lastWeek2Buy = 550;
  numWeeks2Hodl = 260;    # 4 yrs is the min for btc, acc to Adam B.

  else
  init_btc_weekly_0313;
  little_prediction;
  from = 1*40; # skip the first part of the samples , ie. end of 2010 (?)
  till = 860;
  ss = btc(from:till);

  # some BTC params
  lastWeek2Buy = 800;
  numWeeks2Hodl = 200;
  end

dmThrP = 100;          # on a semilog scale, it is 3 orders (10x10x10);
decompose_again = 1

title_2011_2026L = '... 2011 ...... 2012 ...... 2013 ...... 2014 ...... 2015 ......2016 ...... 2017 ...... 2018 ...... 2019 ......2020 ...... 2021 ...... 2022 ...... 2023 ......2024 ...... 2025 ...... 2026 ...... 2027 ...... 2028 ...... 2029 ...... 2030';
title_2011_2026S = '... 2011 ...... 2012 ...... 2013 ...... 2014 ...... 2015 ......2016 ...... 2017 ...... 2018 ...... 2019 ......2020 ...... 2021 ...... 2022 ...... 2023 ......2024 ...... 2025 ...... 2026 ...';

title_2015_2026L = '......  2015  .........  2016  .........  2017 .........  2018  .........  2019  .........  2020  .........  2021  .........  2022  .........  2023  .........  2024  .........  2025  .........  2026 ... ';
title_2015_2026S = '.. 2015 ......... 2016 .........2017 ......... 2018 ......... 2019 ......... 2020 ......... 2021 ......... 2022 ......... 2023 .........2024 ......... 2025 .. ';


# plus some additional curves originally used for BTC.
init_titles;

# =======================
# using normalized-only curves:
# =======================
FourYearPeriodStartsAt = 2019

switch (FourYearPeriodStartsAt)
            case {2011}
              #ss = x1d;
              #dmThrP = +50
              titleSubplot1 = title_2011_2015;
              titleSubplot2 = title_2011_2014;

            case {2015}
              #ss = x2d;
              #dmThrP = +21
              titleSubplot1 = title_2015_2019;
              titleSubplot2 = title_2015_2018;

            case {2019}
              #ss = x3d;
              #dmThrP = +7
              titleSubplot1 = title_2019_2023;
              titleSubplot2 = title_2019_2022;

            case {2023}
              #ss = x4d;
              #dmThrP = +4
              titleSubplot1 = title_2023_2027;
              titleSubplot2 = title_2023_2026;

            otherwise
              beep_on_error # ??
              error ("... invalid FourYearPeriodStartsAt value!");
          endswitch


# =======================
# Plotting Subplot 1:
# =======================

figure(11)
subplot(211)
semilogy(ss)
grid on
if analyze_eth
  title(title_2015_2026L)
else
  title(title_2011_2026L)
  end
ylabel('coin prices')
xlabel('time [weeks]')


# =======================
# Decomposing the vector.
# =======================
# lastWeek2Buy = 550; # defined above
lastWeek2Sell = till-from-5;
#numWeeks2Hodl = 550; # defined above

diff_mat = ones(lastWeek2Buy, lastWeek2Sell);
size(diff_mat)


if decompose_again
for start_at = 1:lastWeek2Buy
  # steppinmg through delay of 2yrs to 3 yrs
  lastWeek2Sell = min(start_at + numWeeks2Hodl, till-from-5);
  for d = start_at:lastWeek2Sell
    # we are going to sum 10 numbers
    diff= 0;
    # we use 3 neighboring samples and their 3 correponding "future" samples
    for i = 1:3
        c1 = start_at + i;
        c2 = d + i;
        diff = diff+ ss(c2) / ss(c1);
      end
      # normalize before storing
      diff_mat (start_at, d) = diff / i;
      end
  endfor

  end # of if decompose_again

# =======================
# ceiling in order to make the gain *locations* more visible

# dmThrP = +3 # defined at the beginning, when choosing the 4Y period
dmThrM = 0.99
diff_mat(diff_mat > dmThrP ) = dmThrP ;
diff_mat(diff_mat < dmThrM ) = dmThrM ;

# =======================
# Plotting Subplot 2:
# =======================

 subplot(212)
 imagesc(diff_mat(1:end, :))
 imagesc(log10(diff_mat(1:end, :)))
if analyze_eth
  title(title_2015_2026S)
else
  title(title_2011_2026S)
  end
 ylabel('Bought-at [week]')
 xlabel('Sold-at [week]')
 colorbar

# =======================
# Marginalizing, after hodl-ingh for numWeeks2Hodl
# =======================
 marg_diff_mat = max(diff_mat, [], 2);
 figure(12)
 subplot(211)
 plot(marg_diff_mat)
 grid on
 xlabel('Bought-at [week]')
 ylabel('Ideal Gain')
 title('max gain capped at 1000')
 title(['max gain during Hodl-ing for ', num2str(numWeeks2Hodl), ' weeks capped at 1000'])

 figure(12)
 subplot(212)
 semilogy(marg_diff_mat)
 grid on
 xlabel('Bought-at [week]')
 ylabel('Ideal Gain')
#title(['max gain during Hodl-ing for ', num2str(numWeeks2Hodl), ' weeks capped at 1000'])
title(title_2011_2026S)

