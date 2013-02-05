Beaver = {}

gtween = require("imported.gtween")

local START_DISPLACEMENT_Y = 50

function Beaver:new()
  local beaver = {}
  beaver.sprite = display.newImage( myImageSheet , sheetInfo:getFrameIndex("beaver"))

  function beaver:show(x,y)
	assert(x ~= nil, "beaver x is null, yo!")
	assert(y ~= nil, "beaver y is null, yo!")
	if (self.tagetPoint == nil) then
	  self.targetPoint = {}
	end
	self.targetPoint.x = x
	self.targetPoint.y = y
	self.sprite.x = self.targetPoint.x
	self.sprite.y = self.targetPoint.y + START_DISPLACEMENT_Y
	stopTween(self.tween)
	self.tween = gtween.new(self.sprite, 0.2, {y = self.targetPoint.y})
	self.tween.onChange = function(tween)
	end
	self.tween.onComplete = function()
	end
  end

  function beaver:hide()
	transition.to(sprite, {time=250, y=targetPoint.y + START_DISPLACEMENT_Y, transition=easing.linear})
  end

  return beaver
end

return Beaver