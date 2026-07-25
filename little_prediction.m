
 # vvls
 # estimated downfall: 60% of ATM
 # AMH = 120k
 # weeks/year: 52

delta = (0.7*12000)/104
# =============================
# predicting one year downwards
# =============================

# last measured value
initV = 70000

for i= 1:104
  #predV(i) = initV - i*delta;
  predV(i) = initV;
end

initV = predV(i)
# =============================
# predicting one year upwards
# =============================

btc = cat(1, btc, predV');
size(btc)


for i= 1:104
  #predV(i) = initV - i*delta;
  predV(i) = initV;
end

btc = cat(1, btc, predV');
size(btc)

# =============================

