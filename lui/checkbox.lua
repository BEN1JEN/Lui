local checkbox = {}
local checkboxes = {}
local mouseDLast = false

function checkbox.newBox(x, y, text, colour)

	if not colour then
		colour = {1, 1, 1}
	end

	checkboxes[#checkboxes + 1] = {x=x, y=y, text=text, ticked=false, colour=colour}

	return #checkboxes
end

function checkbox.updateHaveBeenChecked(delta)

	local mouseX, mouseY = love.mouse.getPosition()
	local mouseD = love.mouse.isDown(1)

	for id, box in ipairs(checkboxes) do
		if mouseD and not mouseDLast and mouseX >= box.x and mouseX <= box.x+16 and mouseY >= box.y and mouseY <= box.y+16 then
			box.ticked = not box.ticked
		end
	end

	mouseDLast = mouseD

end

function checkbox.drawBoxes()

	for id, box in ipairs(checkboxes) do
		love.graphics.setColor(box["colour"][1]+0.8, box["colour"][2]+0.8, box["colour"][3]+0.8)
		love.graphics.rectangle("fill", box.x, box.y, 16, 16)
		if box.ticked then
			love.graphics.setColor(box["colour"][1]*0.95, box["colour"][2]*0.95, box["colour"][3]*0.95)
			love.graphics.rectangle("fill", box.x+2, box.y+2, 12, 12)
		end
		love.graphics.setColor(1, 1, 1)
		love.graphics.print(box.text, box.x+20, box.y-2)
	end

end

function checkbox.isTicked(id)

	return checkboxes[id]["ticked"]

end

return checkbox
