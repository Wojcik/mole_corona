--
-- created with TexturePacker (http://www.texturepacker.com)
--
-- $TexturePacker:SmartUpdate:5f6f3f26767b32f20262494fa6db4ce0$
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
            x=2,
            y=472,
            width=480,
            height=40,

        },
        {
            -- back_middle
            x=484,
            y=424,
            width=480,
            height=94,

        },
        {
            -- back_middle2
            x=484,
            y=324,
            width=480,
            height=98,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 480,
            sourceHeight = 98
        },
        {
            -- back_top
            x=2,
            y=324,
            width=480,
            height=146,

            sourceX = 0,
            sourceY = -0.5,
            sourceWidth = 480,
            sourceHeight = 145
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
            x=700,
            y=570,
            width=54,
            height=52,

            sourceX = 8.5,
            sourceY = 3,
            sourceWidth = 63,
            sourceHeight = 54
        },
        {
            -- button_continue
            x=700,
            y=520,
            width=264,
            height=48,

            sourceX = -0.5,
            sourceY = 0,
            sourceWidth = 263,
            sourceHeight = 48
        },
        {
            -- button_mainmenu
            x=314,
            y=626,
            width=284,
            height=48,

            sourceX = -0.5,
            sourceY = 0,
            sourceWidth = 283,
            sourceHeight = 48
        },
        {
            -- button_pause
            x=330,
            y=582,
            width=34,
            height=34,

        },
        {
            -- button_play
            x=2,
            y=514,
            width=326,
            height=110,

            sourceX = -0.5,
            sourceY = -0.5,
            sourceWidth = 325,
            sourceHeight = 109
        },
        {
            -- button_playagain
            x=2,
            y=626,
            width=310,
            height=48,

            sourceX = -0.5,
            sourceY = 0,
            sourceWidth = 309,
            sourceHeight = 48
        },
        {
            -- fb_icon
            x=600,
            y=582,
            width=54,
            height=54,

            sourceX = -0.5,
            sourceY = -0.5,
            sourceWidth = 53,
            sourceHeight = 53
        },
        {
            -- game_over
            x=330,
            y=520,
            width=368,
            height=60,

            sourceX = 0,
            sourceY = -0.5,
            sourceWidth = 368,
            sourceHeight = 59
        },
        {
            -- heart
            x=924,
            y=570,
            width=24,
            height=22,

            sourceX = -0.5,
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
            x=868,
            y=570,
            width=54,
            height=54,

            sourceX = -0.5,
            sourceY = -0.5,
            sourceWidth = 53,
            sourceHeight = 53
        },
        {
            -- sound_on
            x=812,
            y=570,
            width=54,
            height=54,

            sourceX = -0.5,
            sourceY = -0.5,
            sourceWidth = 53,
            sourceHeight = 53
        },
        {
            -- twitter_icon
            x=756,
            y=570,
            width=54,
            height=54,

            sourceX = -0.5,
            sourceY = -0.5,
            sourceWidth = 53,
            sourceHeight = 53
        },
    },
    
    sheetContentWidth = 966,
    sheetContentHeight = 676
}

SheetInfo.frameIndex =
{

    ["back_bottom"] = 1,
    ["back_middle"] = 2,
    ["back_middle2"] = 3,
    ["back_top"] = 4,
    ["background_menu"] = 5,
    ["beaver"] = 6,
    ["button_continue"] = 7,
    ["button_mainmenu"] = 8,
    ["button_pause"] = 9,
    ["button_play"] = 10,
    ["button_playagain"] = 11,
    ["fb_icon"] = 12,
    ["game_over"] = 13,
    ["heart"] = 14,
    ["shadow_back"] = 15,
    ["sound_off"] = 16,
    ["sound_on"] = 17,
    ["twitter_icon"] = 18,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
