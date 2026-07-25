

# use BTC_init before
# 1. load the 840+ values
# 2. cut the m into 4y frames


# Year  2010 ...  2013
# samples 0x52+1 ... 4x52

Ey_sync = 32
from = 1    + Ey_sync;
till =  208 + Ey_sync;

display('-------------------')
display('Year  2011 ... 2014')
mm1 = min(yyy(from:till))
MM1 = max (yyy(from:till))
av1 = mean(yyy(from:till))

# Year  2014 ...  2017
# samples 4x52+1 ... 8x52

from =  209 + Ey_sync;
till = 416 + Ey_sync;
display('-------------------')
display('Year  2015 ... 2018')
mm2 = min(yyy(from:till))
MM2 = max(yyy(from:till))
av2 = mean(yyy(from:till))

minPos2 = find(yyy==mm2)
minPos2 = rem(minPos2,  208)
disp('--')
maxPos2 = find(yyy==MM2)
maxPos2 = rem(maxPos2,  208)


# Year  2018 ...  2021
# samples 8x52+1 ... 12x52

from = 416 + Ey_sync;
till = 624 + Ey_sync;
display('-------------------')
display('Year  2019 ... 2022')
mm3 = min(yyy(from:till))
MM3 = max(yyy(from:till))
av3 = mean(yyy(from:till))

minPos3 = find(yyy==mm3)
minPos3 = rem(minPos3,  208)
disp('--')
maxPos3 = find(yyy==MM3)
maxPos3 = rem(maxPos3,  208)


# Year  2022 ...  2025
# samples 12x52+1 ... 16x52

from = 625 + Ey_sync;
till = 832 + Ey_sync;
display('-------------------')
display('Year  2023 ...  2026')
mm4 = min(yyy(from:till))
MM4 = max(yyy(from:till))
av4 = mean(yyy(from:till))

minPos4 = find(yyy==mm4)
minPos4 = rem(minPos4,  208)
disp('--')
maxPos4 = find(yyy==MM4)
maxPos4 = rem(maxPos4,  208)



display('-------------------')
display('MMi / mmi')
MM1/mm1
MM2/mm2
MM3/mm3
MM4/mm4

display('-------------------')
display('MMi / MM(i-1)')
MM2/MM1
MM3/MM2
MM4/MM3
disp('comment: actual Max = (200)% of prev. max during a 4y period')

display('-------------------')
display('mm(i) / mm(i-1)')
mm2/mm1
mm3/mm2
mm4/mm3

#display('-------------------')
#display('MM(i) / mm(i-1)')
#MM2/mm1
#MM3/mm2
#MM4/mm3


display('=================')
display('mm(i) / MM(i-1)')
mm2/MM1
mm3/MM2
mm4/MM3
disp('comment: actual min = (30-40)% of prev. max during a 4y period')
display('=================')
display('MM(i) / av(i-1)')
MM2/av1
MM3/av2
MM4/av3

display('-------------------')
display('MM(i) / av(i)')
MM1/av1
MM2/av2
MM3/av3
MM4/av4
disp('comment: max/avg during a 4y period is getting attenuated')

display('-------------------')
display('av(i) / av(i-1)')
av2/av1
av3/av2
av4/av3

disp('comment: avg(i)/avg(i-1) is also getting attenuated')

display('-------------------')
display('av(i) / MM(i-1)')
av2/MM1
av3/MM2
av4/MM3

disp('comment: avg(i)/avg(i-1) is also getting attenuated')


# y axis normalizing coeffs:
la1 = mm4/mm1
la2 = mm4/mm2
la3 = mm4/mm3
la4 = mm4/mm4

