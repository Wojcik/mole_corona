require("src.core.SaveManager")
Model = {}

function Model:new()
    _G.NUM_LIVES = 3
	local model = {}--loadTable("save.json")
	if (model == nil)  then
		model.hightScore = 0
		model.soundOn = true
		model.musicOff = true
	end

	model.currentScore = 0

  	function model:addToCurrentScore(value)
		value = math.max(value, 0)
		self.hightScore = self.hightScore + value
		Runtime:dispatchEvent({target=self, name="ModelScoreChaged"})
    end

    return model
end

return PlayerModel