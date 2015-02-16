% Will McFadden (wmcfadden)
function winnings = taskgame_estimate(probabilities, choices, minval, maxval, easyT, hardT, totalT)
	cbar = mean(choices);
	n_C = totalT/easyT;
	n_C = n_C*(1 - 1/(1+((maxval-minval)/(maxval-cbar))*(easyT/(hardT-easyT))));
	p_sum = 0;
    for i = 1:length(probabilities)
		p = probabilities(i);
		c = choices(i);
		p_sum = p_sum + p*((c+maxval)*(maxval-c)/2+minval*(c-minval))/(maxval-minval);
    end
    p_sum = p_sum/length(probabilities);
	winnings = n_C*p_sum;
end