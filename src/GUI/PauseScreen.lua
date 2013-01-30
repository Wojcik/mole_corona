PauseScreen = {}
local hide

function PauseScreen:new()
	local screen = display.newGroup()
	local back = display.newImage( myImageSheet , sheetInfo:getFrameIndex("shadow_back"))
	local function onBackTouch(event)
		if(event.phase == "ended") then
			hide()
			return true
		end
	end
	back:addEventListener("touch", onBackTouch)
	screen:insert(back)

	local textPic = display.newImage( myImageSheet , sheetInfo:getFrameIndex("button_continue"))
	textPic.x = (display.getCurrentStage().width)*0.5
	textPic.y = (display.getCurrentStage().height)*0.5
	screen:insert(textPic)

	screen.alpha = 0

	local function PauseShowComplete()
	   back:addEventListener("touch", back)
	end

	local function PauseHideComplete()
	    togglePause()
	end

	function screen:show()

	  	transition.to(screen, {time=500, alpha=1, transition=easing.linear, onComplete=PauseShowComplete})
	end

	-- hide will calls from PauseScreen
	function hide()
	  	back:removeEventListener("touch", back)
		transition.to(screen, {time=500, alpha=0, transition=easing.linear, onComplete=PauseHideComplete})
	end

	function screen:destroy()
		back:removeEventListener("touch", back)
		back:removeSelf()
		self:removeSelf()
		return true
    end

	return screen
end

return PauseScreen