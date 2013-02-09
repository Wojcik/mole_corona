
MainLoop = {}

function MainLoop:new()

	local mainLoop = {}

	mainLoop.classType = "GameLoop"
	mainLoop.tickListeners = {}
	mainLoop.lastTick = system.getTimer()
	mainLoop.paused = true

	function mainLoop:addLoopListener(o)
		assert(o ~= nil, "Tick listener mus b not Nil")
		local tickers = self.tickListeners
		local index = table.indexOf(tickers, o)
		if(index == nil) then
			return table.insert(tickers, o)
		else
			error(o, " already added to the game loop.", " name: ", o.name)
			return false
		end
	end

	function mainLoop:removeLoopListener(o)
		local tickers = self.tickListeners
		for i,v in ipairs(tickers) do
			if(v == o) then
				table.remove(tickers, i)
				return true
			end
		end
		self:pause()
		error("!! item not found !!")
		return false
	end

	function mainLoop:onRemoveFromGameLoop(event)
		event.target:removeEventListener("removeFromGameLoop", onRemoveFromGameLoop)
		return mainLoop:removeLoop(event.target)
	end

	function mainLoop:enterFrame(event)
		local lastTick = self.lastTick
		local now = system.getTimer()
		local difference = now - lastTick
		self.lastTick = now

		local i = 1
		local tickers = self.tickListeners
		while tickers[i] do
			tickers[i]:update(difference)
			i = i + 1
		end
	end

	function mainLoop:pause()
		print("MainLoop::pause")
		self.paused = true
		Runtime:removeEventListener("enterFrame", self)

		local tickers = self.tickListeners
		for i,v in ipairs(tickers) do
			if v.pause ~=nil then
				v:pause(true)
			end
		end
	end

	function mainLoop:reset()
		self.lastTick = system.getTimer()
	end

	function mainLoop:start()
		print("MainLoop::start")
		self.paused = false
		Runtime:removeEventListener("enterFrame", self)
		Runtime:addEventListener("enterFrame", self)
		local tickers = self.tickListeners
		for i,v in ipairs(tickers) do
			if v.pause ~=nil then
				v:pause(false)
			end
		end
	end

	function mainLoop:clearListeners()
		local tickers = self.tickListeners
		for i,v in ipairs(tickers) do
			table.remove(tickers, i)
		end
	end

	return mainLoop

end

return MainLoop