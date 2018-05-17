button = {}
buttons = {}

function button.newButtonTexture(imageFile, font)

	local texture = {}
	texture.image = love.graphics.newImage(imageFile)
	texture.image:setFilter("nearest")

	texture.xRes, texture.yRes = texture.image:getDimensions()
	texture.xRes = texture.xRes / 3
	texture.yRes = texture.yRes / 3

	texture.xScale = math.floor(16/texture.xRes+0.5)
	texture.yScale = math.floor(16/texture.yRes+0.5)

	texture.tl = love.graphics.newQuad(0, 0, texture.xRes, texture.yRes, texture.image:getDimensions())
	texture.tc = love.graphics.newQuad(texture.xRes, 0, texture.xRes, texture.yRes, texture.image:getDimensions())
	texture.tr = love.graphics.newQuad(texture.xRes * 2, 0, texture.xRes, texture.yRes, texture.image:getDimensions())
	texture.ml = love.graphics.newQuad(0, texture.yRes, texture.xRes, texture.yRes, texture.image:getDimensions())
	texture.mc = love.graphics.newQuad(texture.xRes, texture.yRes, texture.xRes, texture.yRes, texture.image:getDimensions())
	texture.mr = love.graphics.newQuad(texture.xRes * 2, texture.yRes, texture.xRes, texture.yRes, texture.image:getDimensions())
	texture.bl = love.graphics.newQuad(0, texture.yRes * 2, texture.xRes, texture.yRes, texture.image:getDimensions())
	texture.bc = love.graphics.newQuad(texture.xRes, texture.yRes * 2, texture.xRes, texture.yRes, texture.image:getDimensions())
	texture.br = love.graphics.newQuad(texture.xRes * 2, texture.yRes * 2, texture.xRes, texture.yRes, texture.image:getDimensions())

	texture.font = font

	return texture

end

function button.newButton(x, y, text, texture, colour)

	local id = #buttons + 1
	local btn = {x=x, y=y, width=math.ceil(texture.font:getWidth(text)/8)*8, height=math.ceil(texture.font:getHeight(text)/8)*8, pressed=false}

	local canvas = love.graphics.newCanvas(btn.width, btn.height)
	love.graphics.setCanvas(canvas)

	love.graphics.setColor(1, 1, 1, 1)

	for y = 0, math.ceil(texture.font:getHeight(text)/8) do

		local left, center, right
		if y == 0 then
			left, center, right = texture.tl, texture.tc, texture.tr
		elseif y == math.ceil(texture.font:getHeight(text)/8) then
			left, center, right = texture.bl, texture.bc, texture.br
		else
			left, center, right = texture.ml, texture.mc, texture.mr
		end

		love.graphics.draw(texture.image, left, x, y+y*8, 0, texture.xScale/2, texture.yScale/2)
		for x = 1, math.ceil(texture.font:getWidth(text)/8) do
			love.graphics.draw(texture.image, center, x+8*x, y+y*8, 0, texture.xScale/2, texture.yScale/2)
		end
		love.graphics.draw(texture.image, right, x+8*math.ceil(texture.font:getWidth(text)/8+1), y+y*8, 0, texture.xScale/2, texture.yScale/2)

	end

	love.graphics.setColor(colour)
	love.graphics.setFont(texture.font)
	love.graphics.print(text, x+8, y+4)

	love.graphics.setCanvas()
	btn["canvas"] = canvas

	buttons[id] = btn

	return id

end

function button.updateAreDowns(delta)
	for btn in ipairs(buttons) do

	end
end

function button.drawButtons(scale)
	for id, btn in ipairs(buttons) do

		love.graphics.setCanvas()
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.setBlendMode("alpha", "premultiplied")
		love.graphics.draw(btn.canvas, btn.x, btn.y)

	end
end

return button
