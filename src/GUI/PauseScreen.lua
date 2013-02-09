require ("src.core.Events")
PauseScreen = {}
local hide

function PauseScreen:new()
	local fadeWorking = false
	local screen = display.newGroup()
	local back = display.newImage( myImageSheet , sheetInfo:getFrameIndex("shadow_back"))

	local function onBackTouch(event)
		if(event.phase == "ended" and fadeWorking == false) then
			hide()
		end
		return true
	end
	screen:insert(back)

	local textPic = display.newImage( myImageSheet , sheetInfo:getFrameIndex("button_continue"))
	textPic.x = (display.getCurrentStage().width)*0.5
	textPic.y = 100
	screen:insert(textPic)

	--main menu button
	local mainMenu = display.newImage( myImageSheet , sheetInfo:getFrameIndex("button_mainmenu"))
	mainMenu:setReferencePoint(display.TopLeftReferencePoint)
	mainMenu.x = (display.getCurrentStage().width- mainMenu.width)*0.5
	mainMenu.y = textPic.y + textPic.height + 20
	screen:insert(mainMenu)

	local function onMainMenu(event)
		if(event.phase == "ended") then
			Runtime:dispatchEvent({name=Events.ON_GO_TO_MENU})
			return true
		end
	end
	mainMenu:addEventListener("touch", onMainMenu)
	screen.alpha = 0

	local function PauseShowComplete()
		back:addEventListener("touch", onBackTouch)
		fadeWorking = false
	end

	local function PauseHideComplete()
		back:removeEventListener("touch", onBackTouch)
		fadeWorking = false
		togglePause()
	end

	function screen:show()
		fadeWorking = true
		transition.to(screen, {time=250, alpha=1, transition=easing.linear, onComplete=PauseShowComplete})
	end

	-- hide will calls from PauseScreen
	function hide()
		fadeWorking = true
		transition.to(screen, {time=250, alpha=0, transition=easing.linear, onComplete=PauseHideComplete})
	end

	function screen:destroy()
		back:removeEventListener("touch", back)
		back:removeEventListener("touch", onBackTouch)
		mainMenu:removeEventListener("touch", onMainMenu)
		screen:removeSelf()
		return true
	end

	return screen
end

return PauseScreen