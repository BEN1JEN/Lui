local lui = {}

local button = require "lui.button"
local slider = require "lui.slider"
local checkbox = require "lui.checkbox"
local progress = require "lui.progress"
local radio = require "lui.radio"
local colour = require "lui.colour"
local mouse = require "lui.mouse"

lui.button = button
lui.slider = slider
lui.checkbox = checkbox
lui.progress = progress
lui.radio = radio
lui.colour = colour
lui.mouse = mouse

function lui.update(delta)

	lui.mouse.updatePositionAndDown(delta)
	lui.button.updateAreDowns(delta)
	lui.slider.updatePositions(delta)
	lui.checkbox.updateHaveBeenChecked(delta)
	lui.radio.updateRadioSelectors(delta)
	lui.colour.updateColoursPicked(delta)

end

function lui.draw()

	lui.button.drawButtons()
	lui.slider.drawSliders()
	lui.checkbox.drawBoxes()
	lui.progress.drawPBars()
	lui.radio.drawButnSets()
	lui.colour.drawColours()

end

return lui
