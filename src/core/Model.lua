require("src.core.SaveManager")
require("src.core.Events")
require("src.core.Constants")

Model = {}

function Model:new()
	local model  = {}
	model.memento =  loadTable(Constants.SAVE_FILE_NAME)
	if (model.memento == nil)  then
		model.memento = {}
		model.memento.highScore = 0
		model.memento.soundOn = true
	end
	model.hp = Constants.NUM_LIVES
	model.currentScore = 0


  	function model:addToCurrentScore(value)
		value = math.max(value, 0)
		self.currentScore = self.currentScore + value
		self.memento.highScore = math.max(self.memento.highScore, self.currentScore)
		Runtime:dispatchEvent({name = Events.SCORE_CHANGED })
    end

    function model:onKillBeaver(event)
	    self:addToCurrentScore(Constants.HIT_POINT)
    end
    function model:onSurvivedBeaver(event)
	    if (self.hp > 0) then
		    self.hp = self.hp - 1
		    Runtime:dispatchEvent({name = Events.HP_CHANGED})
	    end
	    if (self.hp == 0) then
		    Runtime:dispatchEvent({name=Events.GAME_OVER})
		    destroy()
		end
	end

	function model:reset()
		self.hp = Constants.NUM_LIVES
		self.currentScore = 0
	end

    function model:register()
	    Runtime:addEventListener(Events.SURVIVED_BEAVER, self)
	    Runtime:addEventListener(Events.KILL_BEAVER, self)
	end

	function model:destroy()
		Runtime:removeEventListener(Events.KILL_BEAVER, self)
		Runtime:removeEventListener(Events.SURVIVED_BEAVER, self)
	end

	function model:save()
		saveTable(self.memento, Constants.SAVE_FILE_NAME)
	end

    return model
end

return PlayerModel