
require "src.core.Utils"
Level = {}

local LEVEL_INIT_STATES = {
  [1] = "READY",
  [2] = "STADY",
  [3] = "GO",
  [4] = nil
}

local BEAVER_Y_DISP = 30

local HOLES_POSITIONS = {
  [1] = {44, 116},
  [2] = {138, 116},
  [3] = {232, 116},
  [4] = {328, 116},
  [5] = {423, 116},

  [6] = {44, 190},
  [7] = {138, 190},
  [8] = {232, 190},
  [9] = {328, 190},
  [10] = {423, 190},

  [11] = {44, 270},
  [12] = {138, 270},
  [13] = {232, 270},
  [14] = {328, 270},
  [15] = {423, 270}
}

local LEVEL_INIT_STATES = protect_table (LEVEL_INIT_STATES)
--HolesPositions = protect_table(HolesPositions)

function Level:new()


  local currentInitState = 1
	local textobj
  local inited = false
  local screen = display.newGroup()

  local back_top = display.newImage(myImageSheet , sheetInfo:getFrameIndex("back_top"))
  back_top:setReferencePoint(display.TopLeftReferencePoint)
  screen:insert(back_top)


  local back_middle = display.newImage(myImageSheet , sheetInfo:getFrameIndex("back_middle"))
  back_middle:setReferencePoint(display.TopLeftReferencePoint)
  back_middle.y = 125.4
  screen:insert(back_middle)

  local back_middle2 = display.newImage(myImageSheet , sheetInfo:getFrameIndex("back_middle2"))
  back_middle2:setReferencePoint(display.TopLeftReferencePoint)
  back_middle2.y = 200
  screen:insert(back_middle2)


    local beaver =  display.newImage(myImageSheet , sheetInfo:getFrameIndex("beaver"))
  local currenHole = HOLES_POSITIONS[math.random(1,#HOLES_POSITIONS)]
  beaver.x = currenHole[1]
  beaver.y = currenHole[2] + BEAVER_Y_DISP
   transition.to(beaver, {time=2000, delay=1000, y=currenHole[2], transition=easing.linear})
  screen:insert(beaver)


  local back_bottom = display.newImage(myImageSheet , sheetInfo:getFrameIndex("back_bottom"))
  back_bottom:setReferencePoint(display.TopLeftReferencePoint)
  back_bottom.y = stage.stageHeight - back_bottom.height - 2
  screen:insert(back_bottom)

  screen.alpha = 0

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
    textobj.text = LEVEL_INIT_STATES[currentInitState]

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