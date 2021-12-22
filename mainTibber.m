% Test program for Tibber Aapi

tib=clTibber(apikey());
[Ep,tm ]=tib.getConsumptions(10000);
plot(tm,Ep)