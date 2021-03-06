% Will McFadden (wmcfadden)
% simulation and analysis of a task game frequently used during psych
% studies.  The basic premise is you choose between doing easy and hard
% tasks based on the expected rewards.  I was trying to find an optimum strategy.

val = [];
cmids = [];
chighs = [];
clows = [];
probabilities = [0.33, 0.66, 1];
minval = 1;
maxval = 5;
easyT = 1;
hardT = 2;
totalT = 2000;
for k = 1:1000
	k
	cmid = unifrnd(minval, maxval);
	clow = unifrnd(minval, maxval);
	chigh = unifrnd(minval, maxval);
	cmids = [cmids cmid];
	chighs = [chighs chigh];
	clows = [clows clow];
	val = [val taskgame_sim(probabilities, [clow, cmid, chigh], minval, maxval, easyT, hardT, totalT)/totalT];
end
max(val)
clows(val==max(val))
cmids(val==max(val))
chighs(val==max(val))

% plot([clows cmids chighs], [val 0.5+val 1+val], '.');

plot3(cmids,chighs,val,'.');
xx = cmids;
yy = chighs;
zz = val;
minX = min(xx);
maxX = max(xx);
minY = min(yy);
maxY = max(yy);

targetSize = [10 10];

xxBin = round( (xx-minX)/(maxX-minX)*(targetSize(1)-1) ) +1;
yyBin = round( (yy-minY)/(maxY-minY)*(targetSize(2)-1) ) +1;
%# map by using accumarray, take the mean of each bin 
map = accumarray([xxBin(:),yyBin(:)],zz,targetSize,@max,0);
xm = accumarray([xxBin(:),yyBin(:)],xx,targetSize,@mean,0);
ym = accumarray([xxBin(:),yyBin(:)],yy,targetSize,@mean,0);
mesh(xm,ym,map)
