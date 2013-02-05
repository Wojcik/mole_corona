require "src.core.Constants"
require "src.core.Utils"
require "src.objects.SceneController"
Level = {}

function Level:new()

  local controller = SceneControler:new();
  local currentInitState = 1
  local textobj
  local inited = false
  local screen = display.newGroup()

  --[[  local back = display.newImage(myImageSheet , sheetInfo:getFrameIndex("background"))
  back:setReferencePoint(display.TopLeftReferencePoint)
  screen:insert(back)]]--

  local back_top = display.newImage(myImageSheet , sheetInfo:getFrameIndex("back_top"))
  back_top:setReferencePoint(display.TopLeftReferencePoint)
  screen:insert(back_top)


  local back_middle = display.newImage(myImageSheet , sheetInfo:getFrameIndex("back_middle_t"))
  back_middle:setReferencePoint(display.TopLeftReferencePoint)
  back_middle.y = 125
  screen:insert(back_middle)

  local back_middle2 = display.newImage(myImageSheet , sheetInfo:getFrameIndex("back_middle_b"))
  back_middle2:setReferencePoint(display.TopLeftReferencePoint)
  back_middle2.y = 202
  screen:insert(back_middle2)

  local back_bottom = display.newImage(myImageSheet , sheetInfo:getFrameIndex("back_bottom"))
  back_bottom:setReferencePoint(display.TopLeftReferencePoint)
  back_bottom.y = 283
  screen:insert(back_bottom)

  screen.alpha = 0

  local function startCount()
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
	textobj.text = Constants.LEVEL_INIT_STATES[currentInitState]

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
	controller:update(dt)
  end

  return screen
end



return Level