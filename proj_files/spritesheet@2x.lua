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
            x=962,
            y=0,
            width=960,
            height=640,

        },
        {
            -- background_menu
            x=0,
            y=642,
            width=960,
            height=640,

        },
        {
            -- button_continue
            x=962,
            y=1178,
            width=526,
            height=96,

        },
        {
            -- button_mainmenu
            x=962,
            y=1080,
            width=566,
            height=96,

        },
        {
            -- button_pause
            x=1582,
            y=982,
            width=68,
            height=68,

        },
        {
            -- button_play
            x=962,
            y=642,
            width=650,
            height=218,

        },
        {
            -- button_playagain
            x=962,
            y=982,
            width=618,
            height=96,

        },
        {
            -- fb_icon
            x=1614,
            y=750,
            width=106,
            height=106,

        },
        {
            -- game_over
            x=962,
            y=862,
            width=736,
            height=118,

        },
        {
            -- heart
            x=1530,
            y=1080,
            width=46,
            height=44,

        },
        {
            -- shadow_back
            x=0,
            y=0,
            width=960,
            height=640,

        },
        {
            -- twitter_icon
            x=1614,
            y=642,
            width=106,
            height=106,

        },
    },
    
    sheetContentWidth = 1922,
    sheetContentHeight = 1282
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
