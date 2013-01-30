
require "src.core.Utils"
Level = {}

LevelInitStates = {
  [1] = "READY",
  [2] = "STADY",
  [3] = "GO",
  [4] = nil
}

LevelInitStates = protect_table (LevelInitStates)

function Level:new()


  local currentInitState = 1
	local textobj
  local inited = false
  local screen = display.newGroup()

  local back = display.newImage(myImageSheet , sheetInfo:getFrameIndex("background"))
  screen:insert(back)
  screen.alpha = 0

  -- remove
	local counter = display.newText("XUI", 50, 50, native.systemFont, 24)
	counter:setTextColor(217, 103, 22)
    counter.x = 100
    counter.y = 100
--

  local function startCount()
    print("startCount")
    if currentInitState == 4 then
      inited = true
      return
    end
    if (textobj == nil) then
      local font  = "Agent Orange" or native.systemFont
      textobj = display.newText("", 50, 50, font, 24)
      textobj:setReferencePoint(display.CenterReferencePoint)
      textobj:setTextColor(217, 103, 22)
    end
    textobj.xScale, textobj.yScale = 1,1
    textobj.alpha = 1
    textobj.x = display.contentWidth *0.5
    textobj.y = display.contentHeight *0.5
    textobj.text = LevelInitStates[currentInitState]

    local delay = 0
    if (currentInitState == 1)  then
      delay = 500
    end
    transition.to(textobj, {time=500, delay=delay, xScale=10, yScale = 10, alpha = 0, transition=easing.inExponential, onComplete=startCount})
    currentInitState = currentInitState + 1;
  end

  function screen:show()
    print("show")
	transition.to(screen, {time=1000, alpha=1, transition=easing.linear})
    startCount()
  end

  function screen:update(dt)
    if (inited == false) then
       return
	end
	counter.text = dt
  end

  return screen
end



return Level