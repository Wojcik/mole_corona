require "src.core.Events"
require "src.core.Sounds"

MainMenu = {}

function MainMenu:new()
	local mainMenu = {}
	mainMenu.screen = display.newGroup()
	mainMenu.btnsScreen = display.newGroup()

	mainMenu.back = display.newImage( myImageSheet , sheetInfo:getFrameIndex("background_menu"))
	mainMenu.back:setReferencePoint(display.TopLeftReferencePoint)
	mainMenu.screen:insert(mainMenu.back)

	mainMenu.startButton = display.newImage( myImageSheet , sheetInfo:getFrameIndex("button_play"))
	mainMenu.startButton:setReferencePoint(display.TopLeftReferencePoint)
	function startTouch(event)
		if(event.phase == "ended") then
			mainMenu:hide()
			return true
		end
	end

	mainMenu.startButton:addEventListener("touch", startTouch)
	mainMenu.startButton.x = (display.getCurrentStage().width - mainMenu.startButton.width)*0.5
	mainMenu.startButton.y = -mainMenu.startButton.height
	mainMenu.screen:insert(mainMenu.startButton)


	-- special buttons --------------------------------------------------------

	local sequenceData = {
		{ name = "off", count=1, start = 1},
		{ name = "on", count=1, start = 2}
	}

	mainMenu.toggleSounds = display.newSprite( soundsSprSheet , sequenceData)
	mainMenu.toggleSounds:setReferencePoint(display.TopLeftReferencePoint)
	mainMenu.toggleSounds.y = 0
	local function onToggleSounds(event)
		if(event.phase == "ended") then
			-- in main.lua
			toggleSounds()
			if not model.memento.soundsOn then
				mainMenu.toggleSounds:setSequence( "off" )
			else
				mainMenu.toggleSounds:setSequence( "on" )
			end
		end
		return true
	end

	mainMenu.toggleSounds:addEventListener("touch", onToggleSounds)
	local seqName = model.memento.soundOn and "on" or "off"
	mainMenu.toggleSounds:setSequence( seqName )
	mainMenu.btnsScreen:insert(mainMenu.toggleSounds)
	print(mainMenu.toggleSounds.y, mainMenu.toggleSounds.height)
	------------------------------------------------------------------------------------------------------------
	mainMenu.fbButton = display.newImage( myImageSheet , sheetInfo:getFrameIndex("fb_icon"))
	mainMenu.fbButton:setReferencePoint(display.TopLeftReferencePoint)
	function fbTouch(event)
		if(event.phase == "ended") then
			system.openURL( "https://facebook.com" )
			return true
		end
	end

	mainMenu.fbButton:addEventListener("touch", fbTouch)
	mainMenu.fbButton.x = mainMenu.btnsScreen.width
	mainMenu.fbButton.y = 0
	mainMenu.btnsScreen:insert(mainMenu.fbButton)
	print(mainMenu.fbButton.y, mainMenu.fbButton.height)
	------------------------------------------------------------------------------------------------------------
	mainMenu.twitterButton = display.newImage( myImageSheet , sheetInfo:getFrameIndex("twitter_icon"))
	mainMenu.twitterButton:setReferencePoint(display.TopLeftReferencePoint)
	function twitterTouch(event)
		if(event.phase == "ended") then
			system.openURL( "https://twitter.com/" )
			return true
		end
	end

	mainMenu.twitterButton:addEventListener("touch", twitterTouch)
	mainMenu.twitterButton.x = mainMenu.btnsScreen.width
	mainMenu.twitterButton.y = 0
	mainMenu.btnsScreen:insert(mainMenu.twitterButton)
	print(mainMenu.twitterButton.height)
	------------------------------------------------------------------------------------------------------------
	mainMenu.screen:insert(mainMenu.btnsScreen)
	mainMenu.btnsScreen:setReferencePoint(display.TopLeftReferencePoint)
	mainMenu.btnsScreen.x = (display.contentWidth - mainMenu.btnsScreen.width)*0.5
	mainMenu.btnsScreen.y = display.contentHeight + mainMenu.btnsScreen.height
	---------------------------------------------------------------------------------
	mainMenu.screen.alpha = 0

	function mainMenu:show()
	    transition.to(self.startButton, {time = 500, y = self.startButton.height*.5, transition = easing.outBounce})
	  	transition.to(self.screen, {time=500, alpha=1, transition=easing.linear})
	  	transition.to(self.btnsScreen, {time=250, y=230, transition=easing.linear})
	end

	local function hideComplete()
		Runtime:dispatchEvent({name=Events.ON_MAIN_MENU_HIDE})
	end

	function mainMenu:hide()
	   	transition.to(self.startButton, {time = 250, y =display.screenOriginY - self.startButton.height, transition = easing.inOutCircular})
		transition.to(self.screen, {time=500, alpha=0, transition=easing.inExponential, onComplete=hideComplete})
		transition.to(self.btnsScreen, {time=250, y=display.contentHeight + self.btnsScreen.height, transition=easing.linear})
	end

	function mainMenu:destroy()
		self.screen:removeSelf()
    end

	return mainMenu
end

return MainMenu