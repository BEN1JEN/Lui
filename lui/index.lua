local lui = {}

local button = require "lui.button"
local slider = require "lui.slider"

lui.button = button
lui.slider = slider

function lui.update(delta)

	lui.button.updateAreDowns(delta)
	lui.slider.updatePositions(delta)

end

function lui.draw()

	lui.button.drawButtons()
	lui.slider.drawSliders()

end

return lui
