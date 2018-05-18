local slider = {}
local sliders = {}

function slider.newSlider(x, y, length, colour, upright, min, max)

	if not colour then
		colour = {1, 1, 1}
	end
	if not min then
		min = 0
	end
	if not max then
		max = 1
	end

	sliders[#sliders+1] = {x=x, y=y, colour=colour, upright=upright, pos=0.3, min=min, max=max, grabbed=false, length=length}

	return #sliders
end

function slider.updatePositions(delta)
end

function slider.drawSliders()
	for id, sld in ipairs(sliders) do
		love.graphics.setColor(sld["colour"][1]/2, sld["colour"][2]/2, sld["colour"][3]/2)
		love.graphics.rectangle("fill", sld.x, sld.y, sld.length, 25)
		love.graphics.setColor(sld.colour)
		love.graphics.rectangle("fill", sld.x+(sld.pos/(sld.max-sld.min)*sld.length-4)+2, sld.y+2, 10, 21)
	end
end

return slider
