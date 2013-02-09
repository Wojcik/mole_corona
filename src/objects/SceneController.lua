require("src.objects.Beaver")
require("src.core.Constants")
SceneControler = {}

function SceneControler:new(beaversArray)
	local controller = {}
	controller.beaversArray = beaversArray

	function controller:addBeaver()
		print("controller:addBeaver")
		if (self.currentBeaver ~= nil) then
			return
		end
		self.currentBeaver = beaversArray[math.random(1, #beaversArray)]
		self.currentBeaver:show()
	end

	function controller:hideBeaver()
		print("controller:hideBeaver")
		self.currentBeaver:hide()
		self.currentBeaver = nil

	end

	function controller:update(dt)
		self.timePassedSinceStart = self.timePassedSinceStart + dt
		if (self.currentBeaver == nil) then
			self.addBeaverTime = self.addBeaverTime - dt
		else
			self.hideBeaverTime = self.hideBeaverTime - dt
		end
		if (self.addBeaverTime <= 0) then
			self:addBeaver()
			self.addBeaverTime = self.showInterval
		elseif (self.hideBeaverTime <= 0 ) then
			self:hideBeaver()
			self.hideBeaverTime = self.hideInterval
		end
		if (self.showInterval >=500 and self.timePassedSinceStart >= Constants.DIFF_INCREASE_TIME) then
			self.timePassedSinceStart = 0
			self.showInterval = self.showInterval/Constants.DIFF_COEFF
			self.hideInterval = self.hideInterval/Constants.DIFF_COEFF
		end
	end

	function controller:reset()
		self.showInterval 			= Constants.SHOW_INTERVAL
		self.hideInterval 			= Constants.HIDE_INTERVAL
		self.addBeaverTime			= 0
		self.hideBeaverTime			= Constants.HIDE_INTERVAL
		self.timePassedSinceStart 	= 0
		self.currentBeaver = nil
	end

	function controller:destroy()
		print("controller was destroed")
		self.beaversArray = nil
		self.currentBeaver = nil
	end

	controller:reset()
	return controller
end

return SceneControler