require("src.objects.Beaver")
require("src.core.Constants")
SceneControler = {}

function SceneControler:new()

  local controller = {}
  controller.showInterval 			= Constants.SHOW_INTERVAL
  controller.hideInterval 			= Constants.HIDE_INTERVAL
  controller.addBeaverTime			= Constants.SHOW_INTERVAL
  controller.timePassedSinceStart 	= 0

  function controller:addBeaver()
	local beaver = Beaver:new()
	print(#Constants.HOLES_POSITIONS)
	local holeCoords = Constants.HOLES_POSITIONS[math.random(1, #Constants.HOLES_POSITIONS)]
	beaver:show(holeCoords[1], holeCoords[2])
	self.addBeaverTime = self.showInterval
	print("game started")
  end

  function controller:increaseDifficulty()

  end

  function controller:update(dt)
	self.addBeaverTime = self.addBeaverTime - dt
	self.timePassedSinceStart = self.timePassedSinceStart + dt
	if (self.addBeaverTime <= 0 ) then
	  self:addBeaver()
	end
	if (self.showInterval >=1000 and self.timePassedSinceStart >= Constants.DIFF_INCREASE_TIME) then
	  self.timePassedSinceStart = 0
	  self.showInterval = self.showInterval/Constants.DIFF_COEFF
	  self.hideInterval = self.hideInterval/Constants.DIFF_COEFF
	end
  end
  return controller
end

return SceneControler