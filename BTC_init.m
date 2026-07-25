# ==========================================
# one-dimensional array (a year of price samples representing weeks), ordered into matrix
# average calculated for every 4yrs
# every row of the matrix (ie. every 4yrs) normalized by the average
# 1st BTC ver.: 02/2026
# ==========================================
clear all

# (1) load the weekly samples from 2010 till today
init_btc_weekly_0313; # this will store the samples
size(btc)

# (2) do a little prediction, to fill inknown samples
#little_prediction;
little_prediction;
size(btc)

# (3) after running this script through, run Basic_analysis.m
ThrM = 0.4
btc(btc < ThrM) = ThrM;   # should have never costet less than 10$
Xmax_4_marg = 204  # marginalization, whne x axis spans 4x52 weeks

# finally run analyze_4x4yrs to see the some buy-sell paie candidates

# unused variables
# ht = hist(btc, 20);

# ====================================
# calculate floating average with a 200 sample hamming Win
# ====================================

win = hamming(26);       # winLen = 1/2 x 52 weeks
SS = sum(win)/1;
y = conv(btc, win);
y = y./SS;

# cut out the middle part, so sync with btc x axis:
yyy = y(13:end-13)

figure 1
clf
subplot(211)
plot(btc)
hold on
grid on
plot(yyy, 'r')
title (' one week graph - BTC')
xlabel('week Nr.')
ylabel('price [$]')

# ====================================
# calculate logs of BTC and Y
# ====================================

eps2 = 0.001;    # b/c the min value in 2010 was 0.06

log_btc = log(btc + eps2);
log_yyy = log(yyy + eps2);

figure(1)
subplot(212)
plot(log_btc)
grid on
hold on
plot(log_yyy)
title (' one week graph - BTC')
xlabel('week Nr.')
ylabel('log-price [-]')


# ======================================
# cutting into frames, starting at 2010
# ======================================

# number of days represented by the data
#ethDays = floor(size(eth,1)/8)
btcDays = 4
#floor(size(btc,1)/Xmax_4_marg)

# Numsamples per day is eigth, B/C we have data at every 8 hrs ;)
STEP  = 205 #   4yrs: 208
FRAMELEN = 250

btcM = zeros (4,FRAMELEN);
yyyM = zeros (4,FRAMELEN );

btcDays = 4
for i= 1:btcDays
  from = (i-1)*STEP + 1;
  till = from + FRAMELEN-1;
  #ethM (i, :)= eth(from:till)';
  btcM (i, :)= btc(from:till)';
  yyyM (i, :)= yyy(from:till)';
end


# ======================================
# cutting into frames, starting at 2011(!)
# ======================================

# number of days represented by the data
#ethDays = floor(size(eth,1)/8)

# Numsamples per day is eigth, B/C we have data at every 8 hrs ;)
#ethM = zeros (ethDays,8);
btcM11 = zeros (btcDays,FRAMELEN);
yyyM11 = zeros (btcDays,FRAMELEN);

btcM11 = zeros (btcDays,FRAMELEN);
yyyM11 = zeros (btcDays,FRAMELEN);

# initroducing 50 value delay, ie. skipping 2010 values.
# please see the values in "init_btc_weekly_0213"
Ey_sync = 32;
#AA = Xmax_4_marg
#BB = Xmax_4_marg -1

for i= 1:btcDays
  #from = i*AA - BB  +Ey_sync
  #till = i*AA       +Ey_sync
  from = (i-1)*STEP + 1 +Ey_sync
  till = from + FRAMELEN-1;
  #
  btcM11 (i, :)= btc(from:till)';
  yyyM11 (i, :)= yyy(from:till)';
end


# ====================================
# Normalize by one average per week
# ====================================
# numSamplesPerWeek = size(btcM,2)
numSamplesPerYear = size(btcM,2)
numYears = size(btcM,1)

# MIN / MAX of a year
btc_min_in_year =  min(btcM, [],2)
btc_max_in_year =  max(btcM, [],2)

# AVG of a year
btc_sum_per_year = sum(btcM,2)
btc_avg_per_year = btc_sum_per_year / numSamplesPerYear

btcM_NormMin = btcM ./ btc_min_in_year;    # weekly samples normalized by yearly MIN
btcM_NormMax = btcM ./ btc_max_in_year;    # weekly samples normalized by yearly MAX
btcM_NormAvg = btcM ./ btc_avg_per_year;   # weekly samples normalized by yearly AVG


# ---
figure (3)
clf
subplot(311)
imagesc (btcM_NormMin)
colorbar
title('weekly samples normalized by 4y-MIN.')
xlabel ('weeks of the year')
ylabel ('years/4')

subplot(312)
imagesc (btcM_NormMax)
colorbar
title('weekly samples normalized by 4y-MAX.')
xlabel ('weeks of the year')
ylabel ('years/4')

subplot(313)
imagesc (btcM_NormAvg)
colorbar
title('weekly samples normalized by 4y-AVG.')
xlabel ('weeks of the year')
ylabel ('years/4')

#
