require ("src.core.Constants")
require ("src.core.Events")
require ("src.core.Locale")

HUD = {}

local SCREENS_MARGINS = {}
SCREENS_MARGINS["l"] = 10
SCREENS_MARGINS["t"] = 10
SCREENS_MARGINS["r"] = 10
SCREENS_MARGINS = protect_table(SCREENS_MARGINS)

local TEXT_SIZE = 16

function HUD:new()

	local hud = {}
	hud.heartsIcons = {}
	hud.screen = display.newGroup()
	hud.scoreGroup = display.newGroup()
	hud.screen:insert(hud.scoreGroup)
	hud.visibleHeartsCnt =  Constants.NUM_LIVES
	for count = 1,hud.visibleHeartsCnt do
	  	local heart = display.newImage( myImageSheet , sheetInfo:getFrameIndex("heart"))
		heart:setReferencePoint(display.TopLeftReferencePoint)
		heart.x = (count - 1)*(heart.width+3) + SCREENS_MARGINS["l"]
		heart.y = SCREENS_MARGINS["t"]
		hud.screen:insert(heart)
		hud.heartsIcons[count] = heart
	end

	--score text field
	local font  = "monoMMM_5" or native.systemFont
	hud.scoreTf = display.newText(Locale.SCORE, 0, 0, font, TEXT_SIZE)
	hud.scoreTf:setTextColor(255, 255, 255)
	hud.scoreGroup:insert(hud.scoreTf)
	-- score value
	hud.scoreValue = display.newText("000000", hud.scoreGroup.width, 0, font, TEXT_SIZE)
	hud.scoreValue:setTextColor(255, 255, 0)
	hud.scoreGroup:insert(hud.scoreValue)

	--hight score field
	hud.highScoreTf = display.newText(Locale.RECORD, hud.scoreGroup.width + 20, 0, font, TEXT_SIZE)
	hud.highScoreTf:setTextColor(255, 255, 255)
	hud.scoreGroup:insert(hud.highScoreTf)
	--hight score value
	hud.highScoreValue = display.newText("000000", hud.scoreGroup.width, 0, font, TEXT_SIZE)
	hud.highScoreValue:setTextColor(255, 255, 0)
	hud.scoreGroup:insert(hud.highScoreValue)

	--hud.scoreGroup.x = (display.contentWidth - hud.scoreGroup.width)*0.5

	local lastHeart =  hud.heartsIcons[Constants.NUM_LIVES]
    --position group between hearts and pause button
	hud.scoreGroup.x =lastHeart.x + lastHeart.width + 10
	hud.scoreGroup.y = SCREENS_MARGINS["t"]
	-----------------------------------------------------------------------------------------------------------------

	hud.pauseButton = display.newImage( myImageSheet , sheetInfo:getFrameIndex("button_pause"))
	hud.pauseButton:setReferencePoint(display.TopRightReferencePoint)
	local function onTouch(event)
		if(event.phase == "ended") then
		  	-- in main.lua
		  	togglePause()
            print("pause touch");
		end
		return true
	end

	hud.pauseButton.x = display.contentWidth - SCREENS_MARGINS["r"]
	hud.pauseButton.y = SCREENS_MARGINS["t"]

	hud.pauseButton:addEventListener("touch", onTouch)
	hud.screen:insert(hud.pauseButton)

	hud.screen.alpha = 0

	function hud:show()
	  	transition.to(hud.screen, {time=500, alpha=1, transition=easing.linear})
	end

	function hud:hide()
		transition.to(hud.screen, {time=500, alpha=0, transition=easing.inExponential})
	end

	function hud:onHpChanged()
		local heart = self.heartsIcons[self.visibleHeartsCnt]
		heart.isVisible = false
		self.visibleHeartsCnt = self.visibleHeartsCnt - 1
	end

	function hud:onScoreChanged(event)
		self.scoreValue.text        = string.format("%06d", model.currentScore)
		self.highScoreValue.text   = string.format("%06d", model.memento.highScore)
    end

	function hud:clickable(value)
        print("clickable ", value)
		if (value)  then
			self.pauseButton:addEventListener("touch", onTouch)
		else
			self.pauseButton:removeEventListener("touch", onTouch)
        end
    end


    function hud:onPauseChanged(event)
        self:clickable(not event.pause)
    end

    function hud:register()
        Runtime:addEventListener(Events.PAUSE_CHANGED, self)
        Runtime:addEventListener(Events.HP_CHANGED, self)
        Runtime:addEventListener(Events.SCORE_CHANGED, self)
    end

	function hud:reset()
		self:clickable(true)
		self.visibleHeartsCnt =  Constants.NUM_LIVES

		local heartsIcons = self.heartsIcons
		for i,v in ipairs(heartsIcons) do
			v.isVisible = true
        end
        self:onScoreChanged()
	end

	function hud:destroy()
		Runtime:removeEventListener(Events.HP_CHANGED, self)
		Runtime:removeEventListener(Events.SCORE_CHANGED, self)
        Runtime:removeEventListener(Events.PAUSE_CHANGED, self)
		self.pauseButton:removeEventListener("touch", onTouch)
		self.screen:removeSelf()
		self.screen = nil
		print("hud was destroyed")
    end
	hud:onScoreChanged()
	return hud
end

return HUD