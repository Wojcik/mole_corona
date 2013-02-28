require "src.core.Constants"
require "src.core.Events"
Beaver = {}

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
	beaver.sprite.x = beaver.targetPoint[1]
	beaver.sprite.y = beaver.targetPoint[2]
	beaver.sprite.isVisible = false
	beaver.killed = false

	function beaver:touch(event)
		if(event.phase == "ended" and self.killed == false) then
			self.killed = true
			self.sprite:setSequence( "dead" )
			sounds:playHit()
			Runtime:dispatchEvent({name=Events.KILL_BEAVER})
			return true
		end
	end
	beaver.sprite:addEventListener("touch", beaver)

	function beaver:show()
		self.sprite.isVisible = true
		self.sprite.parent.maskX = self.targetPoint[1];
		self.sprite.parent.maskY = self.targetPoint[2];
		self.sprite:setSequence( "normal" )
		self.killed = false
		self.sprite.x = self.targetPoint[1]
		self.sprite.y = self.targetPoint[2] + START_DISPLACEMENT_Y
		self.tween = gtween.new(self.sprite, 0.2, {y = self.targetPoint[2]})
		sounds:playAppear()
		self.tween.onComplete = function()
			self.tween:pause()
			self.tween = nil
		end
	end

	function beaver:hide()
		self.tween = gtween.new(self.sprite, 0.2, {y = self.targetPoint[2] + START_DISPLACEMENT_Y})
		sounds:playAppear()
		self.tween.onComplete = function()
            self.sprite.isVisible = false
			if (self.killed == false) then
				print("SURVIVED_BEAVER")
				sounds:playMiss()
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