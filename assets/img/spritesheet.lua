--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:18cae0b4471ebfbe6aaa324b740d1d57$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- background
            x=481,
            y=0,
            width=480,
            height=320,

        },
        {
            -- background_menu
            x=0,
            y=321,
            width=480,
            height=320,

        },
        {
            -- button_continue
            x=481,
            y=589,
            width=263,
            height=48,

        },
        {
            -- button_mainmenu
            x=481,
            y=540,
            width=283,
            height=48,

        },
        {
            -- button_pause
            x=791,
            y=491,
            width=34,
            height=34,

        },
        {
            -- button_play
            x=481,
            y=321,
            width=325,
            height=109,

        },
        {
            -- button_playagain
            x=481,
            y=491,
            width=309,
            height=48,

        },
        {
            -- fb_icon
            x=807,
            y=375,
            width=53,
            height=53,

        },
        {
            -- game_over
            x=481,
            y=431,
            width=368,
            height=59,

        },
        {
            -- heart
            x=765,
            y=540,
            width=23,
            height=22,

        },
        {
            -- shadow_back
            x=0,
            y=0,
            width=480,
            height=320,

        },
        {
            -- twitter_icon
            x=807,
            y=321,
            width=53,
            height=53,

        },
    },
    
    sheetContentWidth = 961,
    sheetContentHeight = 641
}

SheetInfo.frameIndex =
{

    ["background"] = 1,
    ["background_menu"] = 2,
    ["button_continue"] = 3,
    ["button_mainmenu"] = 4,
    ["button_pause"] = 5,
    ["button_play"] = 6,
    ["button_playagain"] = 7,
    ["fb_icon"] = 8,
    ["game_over"] = 9,
    ["heart"] = 10,
    ["shadow_back"] = 11,
    ["twitter_icon"] = 12,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
