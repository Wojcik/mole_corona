require "src.core.Constants"
require "src.core.Utils"
require "src.objects.SceneController"
require("src.objects.Beaver")
Level = {}

function Level:new()
	local level = {}
	level.currentInitState = 1
	level.textobj = nil
	level.inited = false
	level.screen = display.newGroup()
	level.beavers = {}
	level.controller = SceneControler:new(level.beavers);

	level.back_top = display.newImage(myImageSheet , sheetInfo:getFrameIndex("back_top"))
	level.back_top:setReferencePoint(display.TopLeftReferencePoint)
	level.screen:insert(level.back_top)

	local i = 0
	while(i < 15) do
		local beaver = Beaver:new(level.screen.numChildren, i + 1)
		level.screen:insert( beaver.sprite)
		table.insert(level.beavers, beaver)
		i = i + 1;
	end

	level.back_middle = display.newImage(myImageSheet , sheetInfo:getFrameIndex("back_middle_t"))
	level.back_middle:setReferencePoint(display.TopLeftReferencePoint)
	level.back_middle.y = 125
	level.screen:insert(7, level.back_middle)

	level.back_middle2 = display.newImage(myImageSheet , sheetInfo:getFrameIndex("back_middle_b"))
	level.back_middle2:setReferencePoint(display.TopLeftReferencePoint)
	level.back_middle2.y = 202
	level.screen:insert(13, level.back_middle2)

	level.back_bottom = display.newImage(myImageSheet , sheetInfo:getFrameIndex("back_bottom"))
	level.back_bottom:setReferencePoint(display.TopLeftReferencePoint)
	level.back_bottom.y = 283
	level.screen:insert(19, level.back_bottom)

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
			local font  = "BadaBoom BB" or native.systemFont
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
		self.beavers = nil
		self.screen:removeSelf()
		self.screen = nil
		self.controller:destroy()
		self.controller = nil
	end

	return level
end

return Level