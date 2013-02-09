GameOverScreen = {}

function GameOverScreen:new()
	local gameOverScreen = {}
	gameOverScreen.screen = display.newGroup()
	gameOverScreen.back = display.newImage( myImageSheet , sheetInfo:getFrameIndex("shadow_back"))
	gameOverScreen.screen:insert(gameOverScreen.back)

	--game over
	gameOverScreen.gameOverText = display.newImage( myImageSheet , sheetInfo:getFrameIndex("game_over"))
	gameOverScreen.gameOverText:setReferencePoint(display.TopLeftReferencePoint)
	gameOverScreen.gameOverText.x = (display.getCurrentStage().width - gameOverScreen.gameOverText.width)*0.5
	gameOverScreen.gameOverText.y = 50
	gameOverScreen.screen:insert(gameOverScreen.gameOverText)

	--play again button
	gameOverScreen.playAgainBtn = display.newImage( myImageSheet , sheetInfo:getFrameIndex("button_playagain"))
	gameOverScreen.playAgainBtn:setReferencePoint(display.TopLeftReferencePoint)
	gameOverScreen.playAgainBtn.x = (display.getCurrentStage().width - gameOverScreen.playAgainBtn.width)*0.5
	gameOverScreen.playAgainBtn.y = gameOverScreen.gameOverText.y + gameOverScreen.gameOverText.height + 20
	gameOverScreen.screen:insert(gameOverScreen.playAgainBtn)

	local function onPlayAgain(event)
		if(event.phase == "ended") then
			Runtime:dispatchEvent({name=Events.ON_PLAY_AGAIN})
			return true
		end
	end
	gameOverScreen.playAgainBtn:addEventListener("touch", onPlayAgain)

	--main menu button
	gameOverScreen.mainMenu = display.newImage( myImageSheet , sheetInfo:getFrameIndex("button_mainmenu"))
	gameOverScreen.mainMenu:setReferencePoint(display.TopLeftReferencePoint)
	gameOverScreen.mainMenu.x = (display.getCurrentStage().width- gameOverScreen.mainMenu.width)*0.5
	gameOverScreen.mainMenu.y = gameOverScreen.playAgainBtn.y + gameOverScreen.playAgainBtn.height + 20
	gameOverScreen.screen:insert(gameOverScreen.mainMenu)

	local function onMainMenu(event)
		if(event.phase == "ended") then
			Runtime:dispatchEvent({name=Events.ON_GO_TO_MENU})
			return true
		end
	end
	gameOverScreen.mainMenu:addEventListener("touch", onMainMenu)

	gameOverScreen.screen.alpha = 0

	function gameOverScreen:show()
		transition.to(gameOverScreen.screen, {time=100, alpha=1, transition=easing.linear})
	end

	function gameOverScreen:destroy()
		self.screen:removeSelf()
		self.screen = nil
		print("gameOverScreen was destroyed")
	end

	return gameOverScreen
end

return PauseScreen