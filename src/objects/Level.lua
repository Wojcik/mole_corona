--field with holes and beavers

require "src.core.Constants"
require "src.core.Utils"
require "src.objects.SceneController"
require "src.objects.Beaver"
Level = {}

function Level:new()
	local level = {}
	level.currentInitState = 1
	level.textobj = nil
	level.inited = false
	level.screen = display.newGroup()
	level.beaversGroup = display.newGroup()
	level.beavers = {}
	level.controller = SceneControler:new(level.beavers);

	level.back_top = display.newImage(myImageSheet , sheetInfo:getFrameIndex("background"))
	level.back_top:setReferencePoint(display.TopLeftReferencePoint)
	level.screen:insert(level.back_top)

	--apply mask for beaver
	local mask = graphics.newMask( "assets/img/beaverMask.jpg")
	level.beaversGroup:setMask(nil)
	level.beaversGroup:setMask(mask)

	local i = 0
	while(i < 15) do
		local beaver = Beaver:new(i+1)
		level.beaversGroup:insert( beaver.sprite)
		table.insert(level.beavers, beaver)
		i = i + 1;
	end

	local beaver = level.beavers[1]

	level.screen:insert(level.beaversGroup)

	level.screen.alpha = 0

	function level:startCount()
		if self.currentInitState == 4 then
			self.textobj:removeSelf()
			self.tween = nil
			self.textobj = nil
			self.inited = true
			return
		end
		if (self.textobj == nil) then
			local font  = "monoMMM_5" or native.systemFont
			self.textobj = display.newText("", 50, 50, font, 24)
			self.textobj:setReferencePoint(display.CenterReferencePoint)
			self.textobj:setTextColor(217, 103, 22)
		end
		self.textobj.xScale, self.textobj.yScale = 1,1
		self.textobj.alpha = 1
		self.textobj.x = display.contentWidth *0.5
		self.textobj.y = display.contentHeight *0.5
		self.textobj.text = Constants.LEVEL_INIT_STATES[self.currentInitState]

		self.tween = gtween.new(self.textobj, 0.5, {xScale=15, yScale = 15, alpha = 0})
		self.currentInitState = self.currentInitState + 1;

		-- on tween finished
		self.tween.onComplete = function()
			self:startCount()
		end
	end

	function level:show()
		transition.to(self.screen, {time=200, alpha=1, transition=easing.linear})
		self:startCount()
	end

	function level:update(dt)
		if (self.inited == false) then
			return
		end
		self.controller:update(dt)
	end

	function level:reset()
		self.currentInitState = 1
		self.inited = false
		self.controller:reset()
		self:startCount()
	end

	function level:destroy()
		local beavers = self.beavers
		for i,v in ipairs(beavers) do
			v:destroy()
        end
        if self.textobj ~= nil then
            self.textobj:removeSelf()
        end
        if (self.tween ~= nil) then
            self.tween:pause()
        end
        self.tween = nil
        self.textobj = nil
		self.beavers = nil
		self.screen:removeSelf()
		self.screen = nil
		self.controller:destroy()
		self.controller = nil
		print("level:destroy")
	end

	return level
end

return Level