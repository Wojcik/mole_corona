HUD = {}

function HUD:new()
	local screen = display.newGroup()

	print("in hud")
	local pauseButton = display.newImage( myImageSheet , sheetInfo:getFrameIndex("button_pause"))
	pauseButton:setReferencePoint(display.TopLeftReferencePoint)
	local function onTouch(event)
		if(event.phase == "ended") then
		  	togglePause()
			return true
		end
	end

	pauseButton.x = display.contentWidth - pauseButton.width - 10
	pauseButton.y = 10

	pauseButton:addEventListener("touch", onTouch)
	screen:insert(pauseButton)

	screen.alpha = 0

	function screen:show()
	  	transition.to(screen, {time=500, alpha=1, transition=easing.linear})
	end

	function screen:hide()
		transition.to(screen, {time=500, alpha=0, transition=easing.inExponential, onComplete=hideComplete})
	end

	function screen:destroy()
		pauseButton:removeEventListener("touch", onTouch)
		pauseButton:removeSelf()
		self:removeSelf()
		return true
    end

	return screen
end

return HUD