require "CiderDebugger"-----------------------------------------------------------------------------------------

require "src.core.MainLoop"
require "src.GUI.MainMenu"
require "src.objects.Level"
require "src.GUI.HUD"
require "src.GUI.PauseScreen"

display.setStatusBar(display.HiddenStatusBar)

local function initGlobals()
    _G.stage = display.getCurrentStage()
    _G.mainLoop = MainLoop:new()
	_G.mainGroup = display.newGroup()
	mainGroup.name = "mainGroup"
	mainGroup.classType = "mainGroup"
	_G.setMainGroup = function(newGroup)
		_G.mainGroup = newGroup
    end

    sheetInfo = require("spritesheet")
    _G.myImageSheet = graphics.newImageSheet( "spritesheet.png", sheetInfo:getSheet() )
end

local function onStartGameTouched(event)
	mainMenu:hide()
 	return true
end

local function onTitleScreenHideComplete()
	mainMenu:removeEventListener("screenTitle", onStartGameTouched)
	mainMenu:removeEventListener("hideComplete", onTitleScreenHideComplete)
	mainMenu:destroy()

	mainLoop:reset()
	mainLoop:start()

	level = Level:new()
  	level:show()
  	mainLoop:addLoopListener(level)

  	hud = HUD:new()
  	hud:show()
end

local function startGame()
    mainMenu = MainMenu:new()
  	mainMenu:addEventListener("onStartGameTouched", onStartGameTouched)
	mainMenu:addEventListener("onMainMenuHideComplete", onTitleScreenHideComplete)
 	mainMenu:show()
end

local function pauseGame()
	print("pauseGame")
	mainLoop:pause()
	if (pauseScreen == nil)   then
	     pauseScreen = PauseScreen:new()
	end
	pauseScreen:show()
end

local function unpauseGame()
	print("unpauseGame")
	mainLoop:reset()
	mainLoop:start()
end

function togglePause()
  print("togglePause")
	if(mainLoop.paused == true) then
		return unpauseGame()
	else
		return pauseGame()
	end
end

initGlobals()
startGame()
