--
-- created with TexturePacker (http://www.texturepacker.com)
--
-- $TexturePacker:SmartUpdate:776281a820ac162f74322e30618c6ee8$
--
-- local sheetInfo = require("myExportedImageSheet") -- lua file that Texture packer published
--
-- local myImageSheet = graphics.newImageSheet( "ImageSheet.png", sheetInfo:getSheet() ) -- ImageSheet.png is the image Texture packer published
--
-- local myImage1 = display.newImage( myImageSheet , sheetInfo:getFrameIndex("image_name1"))
-- local myImage2 = display.newImage( myImageSheet , sheetInfo:getFrameIndex("image_name2"))
--


local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- back_bottom
            x=0,
            y=934,
            width=960,
            height=74,

        },
        {
            -- back_middle_b
            x=962,
            y=642,
            width=960,
            height=196,

        },
        {
            -- back_middle_t
            x=962,
            y=840,
            width=960,
            height=190,

        },
        {
            -- back_top
            x=0,
            y=642,
            width=960,
            height=290,

        },
        {
            -- background_menu
            x=962,
            y=0,
            width=960,
            height=640,

        },
        {
            -- button_continue
            x=1272,
            y=1032,
            width=526,
            height=96,

        },
        {
            -- button_mainmenu
            x=652,
            y=1130,
            width=566,
            height=96,

        },
        {
            -- button_pause
            x=1220,
            y=1130,
            width=68,
            height=68,

        },
        {
            -- button_play
            x=0,
            y=1010,
            width=650,
            height=218,

        },
        {
            -- button_playagain
            x=652,
            y=1032,
            width=618,
            height=96,

        },
        {
            -- fb_icon
            x=846,
            y=1228,
            width=106,
            height=106,

        },
        {
            -- game_over
            x=0,
            y=1230,
            width=736,
            height=118,

        },
        {
            -- heart
            x=1800,
            y=1032,
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
            x=738,
            y=1228,
            width=106,
            height=106,

        },
    },
    
    sheetContentWidth = 1922,
    sheetContentHeight = 1358
}

SheetInfo.frameIndex =
{

    ["back_bottom"] = 1,
    ["back_middle_b"] = 2,
    ["back_middle_t"] = 3,
    ["back_top"] = 4,
    ["background_menu"] = 5,
    ["button_continue"] = 6,
    ["button_mainmenu"] = 7,
    ["button_pause"] = 8,
    ["button_play"] = 9,
    ["button_playagain"] = 10,
    ["fb_icon"] = 11,
    ["game_over"] = 12,
    ["heart"] = 13,
    ["shadow_back"] = 14,
    ["twitter_icon"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
