require "CiderDebugger"-----------------------------------------------------------------------------------------

require "src.core.MainLoop"
require "src.core.Sounds"
require "src.GUI.MainMenu"
require "src.objects.Level"
require "src.GUI.HUD"
require "src.GUI.PauseScreen"
require "src.GUI.GameOverScreen"
require "src.core.Model"
require "src.core.Events"

display.setStatusBar(display.HiddenStatusBar)
--local model
local mainMenu
local level
local hud
local gameOverScreen

local function initGlobals()
    _G.mainLoop = MainLoop:new()

    sheetInfo = require("spritesheet")
    _G.myImageSheet = graphics.newImageSheet( "spritesheet.png", sheetInfo:getSheet() )

    beaverSheetInfo = require("beaverSprSheet")
    _G.beaverSprSheet = graphics.newImageSheet( "beaverSprSheet.png", beaverSheetInfo:getSheet() )

    soundSheetInfo = require("soundsSheet")
    _G.soundsSprSheet = graphics.newImageSheet( "soundsSheet.png", soundSheetInfo:getSheet() )
end

local function onGameOver(event)
	gameOverScreen = GameOverScreen:new()
	gameOverScreen:show()
	mainLoop:pause()
	hud:clickable(false)
	Runtime:removeEventListener(Events.GAME_OVER, onGameOver)
	Runtime:addEventListener(Events.ON_PLAY_AGAIN, onRestart)
end

local function onMenuHideComplete()
	Runtime:removeEventListener(Events.ON_MAIN_MENU_HIDE, onMenuHideComplete)
	mainMenu:destroy()
	mainMenu = nil

	mainLoop:reset()
	mainLoop:start()

	level = Level:new()
  	level:show()
  	mainLoop:addLoopListener(level)

  	hud = HUD:new()
	hud:register()
  	hud:show()

	model:reset()
	Runtime:addEventListener(Events.GAME_OVER, onGameOver)
end

local function showMainMenu()
	print("show main menu---------------------------------------------------------------------")
	mainMenu = MainMenu:new()
	Runtime:addEventListener(Events.ON_MAIN_MENU_HIDE, onMenuHideComplete)
	mainMenu:show()
end

local function startGame()
    model = Model:new()
    model:register()
    sounds = Sounds:new()
    sounds:play()
	showMainMenu()
    Runtime:addEventListener(Events.ON_GO_TO_MENU, onGoToMenu)
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

function toggleSounds()
	print("toggleSounds")
	if(sounds.muted == true) then
		sounds:play()
	else
		sounds:stop()
	end
end


--total reset
local function restartGame()
	model:reset()
	mainLoop:reset()
	mainLoop:pause()
	if (level ~= nil)  then
		level:reset()
	end
	if (gameOverScreen ~= nil)  then
		gameOverScreen:destroy()
		gameOverScreen = nil
	end
	if (hud ~= nil) then
		hud:reset()
	end
	hud:clickable(true)

	mainLoop:start()
	Runtime:addEventListener(Events.GAME_OVER, onGameOver)
	Runtime:removeEventListener(Events.ON_PLAY_AGAIN, onRestart)
	print("after restart",system.getInfo("textureMemoryUsed"))
end

--total clearing of all resources (except model)
local function clearAll()
	print("before clean",system.getInfo("textureMemoryUsed"))
	mainLoop:clearListeners()
	if (level ~= nil)  then
		level:destroy()
		level = nil
	end

	if (pauseScreen ~= nil)  then
		pauseScreen:destroy()
		pauseScreen = nil
	end
	if (gameOverScreen ~= nil)  then
		gameOverScreen:destroy()
		gameOverScreen = nil
	end
	if (hud ~= nil) then
		hud:destroy()
		hud = nil
	end
	Runtime:removeEventListener(Events.ON_PLAY_AGAIN, onRestart)
	collectgarbage("collectlua")
	print("after clean", system.getInfo("textureMemoryUsed"))
end

function onGoToMenu(event)
	clearAll()
	showMainMenu()
end

function onRestart(event)
	restartGame()
end

initGlobals()
startGame()


local function onSystemEvent( event )
	if event.type == "applicationSuspend" then
		pauseGame()
		model:save()
	end
end

Runtime:addEventListener( "system", onSystemEvent )
