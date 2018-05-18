function love.load()

	lui = require "lui.index"
	text = "hmm..."

	font = love.graphics.newFont("Ubuntu.ttf", 18)
	default = lui.button.newButtonTexture("lui/assets/highResButton.bmp", font)
	heidi = lui.button.newButtonTexture("lui/assets/heidiButton.bmp", font)
	Hiid = lui.button.newButton(100, 200, "Hello", default, {1, 1, 1})
	Byid = lui.button.newButton(100, 250, "Goodbye", default, {0, 0, 1})
	Spid = lui.button.newButton(500, 200, "This is a special button", heidi, {0, 0, 0})

	Tyid = lui.slider.newSlider(500, 10, 150)

	Slid = lui.slider.newSlider(250, 100, 200)

	Shid = lui.checkbox.newBox(500, 250, "show text", {0, 0.2, 1})

	Prid = lui.progress.newBar(50, 600, 1000, 50)

	Rbid = lui.radio.newButtonSet(800, 300, {"Hello", "Goodbye", "Other", "foo", "bar", "baz"})

	Clid = lui.colour.newPicker(800, 10)
end

function love.draw()
	lui.draw()
	love.graphics.setColor(1, 1, 1)
	if lui.checkbox.isTicked(Shid) then
		love.graphics.setColor(lui.colour.getColour(Clid))
		love.graphics.print(text, lui.slider.getPosition(Tyid)*100, 10)
	end
end

function love.update(delta)
	lui.update()
	if lui.button.isDown(Hiid) then
		text = "hello"
	end
	if lui.button.isDown(Byid) then
		text = "bye"
	end
	if lui.button.isDown(Spid) then
		text = lui.radio.getSelected(Rbid)
	end

	lui.progress.setProgress(Prid, lui.slider.getPosition(Slid))
end
