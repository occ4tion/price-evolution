


# analyze input 4Y price vector and derive "enter-exit" map depicting gains/losses for a 4-year period
# tesing vector Y is derived in "reconstruct.m"
# but we will use the orig price vectors from "basic_analysis"
# --
# uses "btx_init"
# uses "basic analysis"
# uses "reconstruct"

# =======================
# using normalized-tilted curves
# =======================
#ss = Y(1:end);
#ss = Y(208:end);
#ss = Y(416:end);
#ss = Y(624:end);

# =======================
# using normalized-only curves:
# =======================
FourYearPeriodStartsAt = 2019

switch (FourYearPeriodStartsAt)
            case {2011}
              ss = x1d;
              dmThrP = +50
              titleSubplot1 = title_2011_2015;
              titleSubplot2 = title_2011_2014;

            case {2015}
              ss = x2d;
              dmThrP = +21
              titleSubplot1 = title_2015_2019;
              titleSubplot2 = title_2015_2018;

            case {2019}
              ss = x3d;
              dmThrP = +7
              titleSubplot1 = title_2019_2023;
              titleSubplot2 = title_2019_2022;

            case {2023}
              ss = x4d;
              dmThrP = +4
              titleSubplot1 = title_2023_2027;
              titleSubplot2 = title_2023_2026;

            otherwise
              beep_on_error # ??
              error ("... invalid FourYearPeriodStartsAt value!");
          endswitch

#ss = x1d;
#ss = x2d;
#ss = x3d;
#ss = x4d;

#title(title_2011_2014)
#title(title_2015_2019)
#title(title_2019_2022)
#title(title_2023_2026)

#title(title_2011_2015)
#title(title_2015_2019)
#title(title_2019_2023)
#title(title_2023_2027)

# =======================
# Plotting Subplot 1:
# =======================

figure(11)
subplot(211)
plot(ss(1:250))
grid on
title(titleSubplot1)
ylabel('coin prices')
xlabel('time [weeks]')


# =======================
# Decomposing the vector.
# =======================
lastWeek2Buy = 150;
lastWeek2Sell = 200;

diff_mat = ones(lastWeek2Buy, lastWeek2Sell);
size(diff_mat)

for start_at = 1:lastWeek2Buy
  # steppinmg through delay of 2yrs to 3 yrs
  for d = start_at:lastWeek2Sell
    # we are going to sum 10 numbers
    diff= 0;
    # we use 3 neighboring samples and their 3 correponding future samples
    for i = 1:3
        c1 = start_at + i;
        c2 = d + i;
        diff = diff+ ss(c2) / ss(c1);
      end
      # normalize before storing
      diff_mat (start_at, d) = diff / i;
      end
  endfor

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
 # imagesc(log10(diff_mat(1:end, :)))
 title(titleSubplot2)
 ylabel('buy-at [week]')
 xlabel('"Enter-exit" map: sell-at [week]')
 colorbar



