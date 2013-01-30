HUD = {}
local NUM_LIVES = 3
local SCREENS_MARGINS = {}
SCREENS_MARGINS["l"] = 10
SCREENS_MARGINS["t"] = 10
SCREENS_MARGINS["r"] = 10
SCREENS_MARGINS = protect_table(SCREENS_MARGINS)

function HUD:new()
  	local heartsIcons = {}
	local screen = display.newGroup()

	for count = 1,NUM_LIVES do
	  	local heart = display.newImage( myImageSheet , sheetInfo:getFrameIndex("heart"))
		heart:setReferencePoint(display.TopLeftReferencePoint)
		heart.x = (count - 1)*(heart.width+3) + SCREENS_MARGINS["l"]
		heart.y = SCREENS_MARGINS["t"]
		screen:insert(heart)
		heartsIcons[count] = heart
	end

	print("in hud")
	local pauseButton = display.newImage( myImageSheet , sheetInfo:getFrameIndex("button_pause"))
	pauseButton:setReferencePoint(display.TopRightReferencePoint)
	local function onTouch(event)
		if(event.phase == "ended") then
		  	-- in main.lua
		  	togglePause()
		end
		return true
	end

	pauseButton.x = display.contentWidth - SCREENS_MARGINS["r"]
	pauseButton.y = SCREENS_MARGINS["t"]

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