function love.load()

	lui = require "lui.index"
	text = "hmm..."

	font = love.graphics.newFont("Ubuntu.ttf", 18)
	default = lui.button.newButtonTexture("lui/assets/highResButton.bmp", font)
	heidi = lui.button.newButtonTexture("lui/assets/heidiButton.bmp", font)
	Hiid = lui.button.newButton(100, 200, "Hello", default, {1, 1, 1})
	Byid = lui.button.newButton(100, 250, "Goodbye", default, {0, 0, 1})
	lui.button.newButton(500, 200, "This is a heidi button", heidi, {0, 0, 0})

	lui.slider.newSlider(500, 10, 150)

end

function love.draw()
	lui.draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.print(text)
end



function love.update(delta)
	lui.update()
	if lui.button.isDown(Hiid) then
		text = "hello"
	end
	if lui.button.isDown(Byid) then
		text = "bye"
	end
end
