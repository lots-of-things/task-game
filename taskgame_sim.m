% Will McFadden (wmcfadden)
function winnings = taskgame_sim(probabilities, choices, minval, maxval, easyT, hardT, totalT)
	winnings = 0;
	i = 1;
	t = 0;
	while (t<totalT)
		index = unidrnd(length(probabilities));
		p = probabilities(index);
		c = choices(index);
		offer = unifrnd(minval, maxval);
		if(unifrnd(0, 1)<p)
			if(offer>c)
				winnings = winnings+offer;
				t = t+hardT;
			else
				winnings = winnings+minval;
				t = t+easyT;
            end
		else
			if(offer>c)
				t = t+hardT;
            else
				t = t+easyT;
            end
        end
    end
end