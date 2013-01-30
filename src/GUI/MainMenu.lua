MainMenu = {}

function MainMenu:new()
	local screen = display.newGroup()

	local back = display.newImage( myImageSheet , sheetInfo:getFrameIndex("background_menu"))
	back:setReferencePoint(display.TopLeftReferencePoint)
	screen:insert(back)
	back.width = stage.contentWidth
	back.height = stage.contentHeight

	local startButton = display.newImage( myImageSheet , sheetInfo:getFrameIndex("button_play"))
	startButton:setReferencePoint(display.TopLeftReferencePoint)
	function startButton:touch(event)
		if(event.phase == "ended") then
			screen:dispatchEvent({name="onStartGameTouched", target=self})
			return true
		end
	end
	startButton:addEventListener("touch", startButton)
	startButton.x = (display.getCurrentStage().width - startButton.width)*0.5
	startButton.y = -startButton.height
	screen:insert(startButton)

	screen.alpha = 0

	function screen:show()
	    transition.to(startButton, {time = 500, y = startButton.height*.5, transition = easing.outBounce})
	  	transition.to(screen, {time=500, alpha=1, transition=easing.linear})
	end

	function screen:hide()
	   	transition.to(startButton, {time = 250, y =display.screenOriginY - startButton.height, transition = easing.inOutCircular})
		transition.to(screen, {time=500, alpha=0, transition=easing.inExponential, onComplete=hideComplete})
	end

	function hideComplete()
	  	print ("hide complete")
		screen:dispatchEvent({name="onMainMenuHideComplete", target=screen})
	end

	function screen:destroy()
		back:removeSelf()
		startButton:removeEventListener("touch", startButton)
		startButton:removeSelf()
		self:removeSelf()
		return true
    end

	return screen
end

return MainMenu