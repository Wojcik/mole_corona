require "src.core.Constants"
require "src.core.Events"
Beaver = {}

gtween = require("imported.gtween")

local START_DISPLACEMENT_Y = 50

function Beaver:new(holeIndex)
	assert(holeIndex ~= nil, "beaver holeIndex is null, yo!")
	local beaver = {}
	beaver.targetPoint = Constants.HOLES_POSITIONS[holeIndex]
	local sequenceData = {
		{ name = "dead", start=2, count=1, time=0 },
		{ name = "normal", frames={ 1 }, time=0 }
	}
	beaver.sprite = display.newSprite( beaverSprSheet , sequenceData)
	beaver.sprite.isVisible = false
	beaver.killed = false

	function beaver:touch(event)
		if(event.phase == "ended" and self.killed == false) then
			self.killed = true
			self.sprite:setSequence( "dead" )
			system.vibrate()
			Runtime:dispatchEvent({name=Events.KILL_BEAVER})
			return true
		end
	end
	beaver.sprite:addEventListener("touch", beaver)

	function beaver:show()
		self.sprite.isVisible = true
		self.sprite:setSequence( "normal" )
		self.killed = false
		self.sprite.isVisible = true
		self.sprite.x = self.targetPoint[1]
		self.sprite.y = self.targetPoint[2] + START_DISPLACEMENT_Y
		self.tween = gtween.new(self.sprite, 0.2, {y = self.targetPoint[2]})
		self.tween.onChange = function(tween)
		end
		self.tween.onComplete = function()
			self.tween:pause()
			self.tween = nil
		end
	end

	function beaver:hide()
		print("beaver hide")
		self.tween = gtween.new(self.sprite, 0.2, {y = self.targetPoint[2] + START_DISPLACEMENT_Y})
		self.tween.onChange = function(tween)
		end

		self.tween.onComplete = function()
			if (self.killed == false) then
				print("SURVIVED_BEAVER")
				self.sprite.isVisible = false
				Runtime:dispatchEvent({name=Events.SURVIVED_BEAVER})
				self.tween:pause()
				self.tween = nil
			end

		end
	end

	function beaver:destroy()
		self.sprite:removeSelf()
		if (self.tween ~= nil) then
			self.tween:pause()
			self.tween = nil
		end
		self.targetPoint = nil
		print("beaver was destroed")
	end

	return beaver
end

return Beaver