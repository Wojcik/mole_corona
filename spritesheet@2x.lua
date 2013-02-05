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
            x=4,
            y=944,
            width=960,
            height=80,

        },
        {
            -- back_middle
            x=968,
            y=848,
            width=960,
            height=188,

        },
        {
            -- back_middle2
            x=968,
            y=648,
            width=960,
            height=196,

            sourceX = 0,
            sourceY = -0.5,
            sourceWidth = 960,
            sourceHeight = 195
        },
        {
            -- back_top
            x=4,
            y=648,
            width=960,
            height=292,

            sourceX = 0,
            sourceY = -1.5,
            sourceWidth = 960,
            sourceHeight = 289
        },
        {
            -- background_menu
            x=968,
            y=4,
            width=960,
            height=640,

        },
        {
            -- beaver
            x=1400,
            y=1140,
            width=108,
            height=104,

            sourceX = 17,
            sourceY = 6,
            sourceWidth = 126,
            sourceHeight = 108
        },
        {
            -- button_continue
            x=1400,
            y=1040,
            width=528,
            height=96,

            sourceX = -1,
            sourceY = 0,
            sourceWidth = 526,
            sourceHeight = 96
        },
        {
            -- button_mainmenu
            x=628,
            y=1252,
            width=568,
            height=96,

            sourceX = -1,
            sourceY = 0,
            sourceWidth = 566,
            sourceHeight = 96
        },
        {
            -- button_pause
            x=660,
            y=1164,
            width=68,
            height=68,

        },
        {
            -- button_play
            x=4,
            y=1028,
            width=652,
            height=220,

            sourceX = -1,
            sourceY = -1,
            sourceWidth = 650,
            sourceHeight = 218
        },
        {
            -- button_playagain
            x=4,
            y=1252,
            width=620,
            height=96,

            sourceX = -1,
            sourceY = 0,
            sourceWidth = 618,
            sourceHeight = 96
        },
        {
            -- fb_icon
            x=1200,
            y=1164,
            width=108,
            height=108,

            sourceX = -1,
            sourceY = -1,
            sourceWidth = 106,
            sourceHeight = 106
        },
        {
            -- game_over
            x=660,
            y=1040,
            width=736,
            height=120,

            sourceX = 0,
            sourceY = -1,
            sourceWidth = 736,
            sourceHeight = 118
        },
        {
            -- heart
            x=1848,
            y=1140,
            width=48,
            height=44,

            sourceX = -1,
            sourceY = 0,
            sourceWidth = 46,
            sourceHeight = 44
        },
        {
            -- shadow_back
            x=4,
            y=4,
            width=960,
            height=640,

        },
        {
            -- sound_off
            x=1736,
            y=1140,
            width=108,
            height=108,

            sourceX = -1,
            sourceY = -1,
            sourceWidth = 106,
            sourceHeight = 106
        },
        {
            -- sound_on
            x=1624,
            y=1140,
            width=108,
            height=108,

            sourceX = -1,
            sourceY = -1,
            sourceWidth = 106,
            sourceHeight = 106
        },
        {
            -- twitter_icon
            x=1512,
            y=1140,
            width=108,
            height=108,

            sourceX = -1,
            sourceY = -1,
            sourceWidth = 106,
            sourceHeight = 106
        },
    },
    
    sheetContentWidth = 1932,
    sheetContentHeight = 1352
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
