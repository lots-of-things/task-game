% Will McFadden (wmcfadden)
% simulation and analysis of a task game frequently used during psych
% studies.  The basic premise is you choose between doing easy and hard
% tasks based on the expected rewards.  I was trying to find an optimum strategy.
% taskgame)

val = [];
cmids = [];
chighs = [];
clows = [];
probabilities = [0.12, 0.5, 0.88];
minval = 1;
maxval = 5;
easyT = 1;
hardT = 2;
totalT = 10000;
for k = 1:1000
	k
	cmid = unifrnd(minval, maxval);
	clow = unifrnd(minval, maxval);
	chigh = unifrnd(minval, maxval);
	cmids = [cmids cmid];
	chighs = [chighs chigh];
	clows = [clows clow];
	val = [val taskgame_estimate(probabilities, [clow, cmid, chigh], minval, maxval, easyT, hardT, totalT)/totalT];
end
max(val)
clows(val==max(val))
cmids(val==max(val))
chighs(val==max(val))

plot([clows cmids chighs], [val 0.5+val 1+val], '.');