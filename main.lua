function love.load()

	lui = require "lui.index"
	textModUI = lui()

	text = "hmm..."

	font = love.graphics.newFont("Ubuntu.ttf", 18)
	default = textModUI.button.newButtonTexture("lui/assets/highResButton.bmp", font)
	heidi = textModUI.button.newButtonTexture("lui/assets/heidiButton.bmp", font)
	Hiid = textModUI.button.newButton(100, 200, "Hello", default, {1, 1, 1})
	Byid = textModUI.button.newButton(100, 250, "Goodbye", default, {0, 0, 1})
	Spid = textModUI.button.newButton(500, 200, "This is a special button", heidi, {0, 0, 0})

	Tyid = textModUI.slider.newSlider(500, 10, 150)

	Slid = textModUI.slider.newSlider(250, 100, 200)

	Shid = textModUI.checkbox.newBox(500, 250, "show text", {0, 0.2, 1})

	Prid = textModUI.progress.newBar(50, 600, 1000, 50)

	Rbid = textModUI.radio.newButtonSet(800, 300, {"Hello", "Goodbye", "Other", "foo", "bar", "baz"})

	Clid = textModUI.colour.newPicker(800, 10)
end

function love.draw()
	textModUI.draw()
	love.graphics.setColor(1, 1, 1)
	if textModUI.checkbox.isTicked(Shid) then
		love.graphics.setColor(textModUI.colour.getColour(Clid))
		love.graphics.print(text, textModUI.slider.getPosition(Tyid)*100, 10)
	end
end

function love.update(delta)
	textModUI.update()
	if textModUI.button.isDown(Hiid) then
		text = "hello"
	end
	if textModUI.button.isDown(Byid) then
		text = "bye"
	end
	if textModUI.button.isDown(Spid) then
		text = textModUI.radio.getSelected(Rbid)
	end

	textModUI.progress.setProgress(Prid, textModUI.slider.getPosition(Slid))
end
