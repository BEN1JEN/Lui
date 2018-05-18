function love.load()

	lui = require "lui.index"


	font = love.graphics.newFont("Ubuntu.ttf", 18)
	default = lui.button.newButtonTexture("lui/assets/defaultButton.bmp", font)
	heidi = lui.button.newButtonTexture("lui/assets/heidiButton.bmp", font)
	id = lui.button.newButton(100, 200, "Hello", default, {1, 1, 1})
	id = lui.button.newButton(100, 250, "Goodbye", default, {0, 0, 1, 0.5})
	id = lui.button.newButton(500, 200, "This is a heidi button", heidi, {0, 0, 0})

end

function love.draw()
	lui.draw()
end



function love.update(delta)
	lui.update()
end
