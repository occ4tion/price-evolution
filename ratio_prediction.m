
#===================================
# Predicts price ratios at the end of 3y/4y persods
# requires basic_analysis.m
# requires BTC_init.m
# 1st ver 2026 03 02
#===================================

# multipliers
M2013 = 2050  # max(yr 2013) = 1050
m2011 = 1     # kb
ratio1 = M2013 / m2011

disp('--')
# 2015 > 2017
M2017 = 20000
m2015 = 300
ratio2 = M2017 / m2015

disp('--')
# 2019 > 2021
M2021 = 66000
m2019 = 3500
ratio3 = M2021 / m2019

disp('--')
# 2015 > 2017
M2025 = 125000
m2023 = 16300
ratio4 = M2025 / m2023

# guessing a bit.
#M2029#
#m2027 = 40000

disp('--')

#===================================
# Ratios Upwards at the end of 3y persods !!
#===================================
disp('------------------------------')
disp('RATIOS at the EOF 3Y periods')
disp('Ratios: 2050, 67, 18, 7.67  ')

disp('-Now fitting and predicting: ')
init_ratio = 1500
ratio = init_ratio;

# cyclus Number = 5 (2027-2030)
for i=1:5
  disp(ratio)
  prev_ratio = ratio;
  # ------- KEY1 BELOW -------
  ratio = 2* sqrt(prev_ratio);
  # --------------------------
end

maxRatio = prev_ratio


#===================================
# Ratios at the end of 4y persods
#===================================
disp('------------------------------')
disp('RATIOS at the EOF 4Y periods')
disp('Ratios: 400, 25, 5, ??  ')

disp('-Now fitting and predicting: ')
init_ratio = 400
ratio = init_ratio;

# cyclus Number = 4 (2023-2026)
for i=1:4
  disp(ratio)
  prev_ratio = ratio;
  # ------- KEY2 BELOW -------
  ratio = sqrt(prev_ratio);
  # --------------------------
end

minRatio = prev_ratio

#===================================
# SOME PREDICTIOS
#===================================
m2027 = predictedNextMin
M2029 = predictedNextMax

predictedNextMin = round(minRatio * m2023);
predictedNextMax = round(maxRatio * m2027);


disp('------------------------------')
disp('predicted BTC price EOF 2026')
disp (['minOf2023 * minRatio = ', num2str(predictedNextMin)])

disp('------------------------------')
disp('predicted BTC price EOF 2029')
disp (['minOf2023 * maxRatio = ', num2str(predictedNextMax )])
disp('------------------------------')

#===================================
















