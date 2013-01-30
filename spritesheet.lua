--
-- created with TexturePacker (http://www.texturepacker.com)
--
-- $TexturePacker:SmartUpdate:796f956c0c0c4979f8795a5249e35c2d$
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
            -- background
            x=2,
            y=340,
            width=480,
            height=320,

        },
        {
            -- background_menu
            x=484,
            y=2,
            width=480,
            height=320,

        },
        {
            -- beaver
            x=966,
            y=226,
            width=54,
            height=52,

            sourceX = 4,
            sourceY = 2,
            sourceWidth = 63,
            sourceHeight = 54
        },
        {
            -- button_continue
            x=484,
            y=598,
            width=264,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 263,
            sourceHeight = 48
        },
        {
            -- button_mainmenu
            x=484,
            y=548,
            width=284,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 283,
            sourceHeight = 48
        },
        {
            -- button_pause
            x=966,
            y=280,
            width=34,
            height=34,

        },
        {
            -- button_play
            x=484,
            y=386,
            width=326,
            height=110,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 325,
            sourceHeight = 109
        },
        {
            -- button_playagain
            x=484,
            y=498,
            width=310,
            height=48,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 309,
            sourceHeight = 48
        },
        {
            -- fb_icon
            x=966,
            y=170,
            width=54,
            height=54,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 53,
            sourceHeight = 53
        },
        {
            -- game_over
            x=484,
            y=324,
            width=368,
            height=60,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 368,
            sourceHeight = 59
        },
        {
            -- heart
            x=966,
            y=316,
            width=24,
            height=22,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 23,
            sourceHeight = 22
        },
        {
            -- shadow_back
            x=2,
            y=2,
            width=480,
            height=320,

        },
        {
            -- sound_off
            x=966,
            y=114,
            width=54,
            height=54,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 53,
            sourceHeight = 53
        },
        {
            -- sound_on
            x=966,
            y=58,
            width=54,
            height=54,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 53,
            sourceHeight = 53
        },
        {
            -- twitter_icon
            x=966,
            y=2,
            width=54,
            height=54,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 53,
            sourceHeight = 53
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["background"] = 1,
    ["background_menu"] = 2,
    ["beaver"] = 3,
    ["button_continue"] = 4,
    ["button_mainmenu"] = 5,
    ["button_pause"] = 6,
    ["button_play"] = 7,
    ["button_playagain"] = 8,
    ["fb_icon"] = 9,
    ["game_over"] = 10,
    ["heart"] = 11,
    ["shadow_back"] = 12,
    ["sound_off"] = 13,
    ["sound_on"] = 14,
    ["twitter_icon"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
