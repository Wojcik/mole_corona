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
            x=4,
            y=680,
            width=960,
            height=640,

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
            x=1932,
            y=452,
            width=108,
            height=104,

            sourceX = 8,
            sourceY = 4,
            sourceWidth = 126,
            sourceHeight = 108
        },
        {
            -- button_continue
            x=968,
            y=1196,
            width=528,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 526,
            sourceHeight = 96
        },
        {
            -- button_mainmenu
            x=968,
            y=1096,
            width=568,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 566,
            sourceHeight = 96
        },
        {
            -- button_pause
            x=1932,
            y=560,
            width=68,
            height=68,

        },
        {
            -- button_play
            x=968,
            y=772,
            width=652,
            height=220,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 650,
            sourceHeight = 218
        },
        {
            -- button_playagain
            x=968,
            y=996,
            width=620,
            height=96,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 618,
            sourceHeight = 96
        },
        {
            -- fb_icon
            x=1932,
            y=340,
            width=108,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 106,
            sourceHeight = 106
        },
        {
            -- game_over
            x=968,
            y=648,
            width=736,
            height=120,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 736,
            sourceHeight = 118
        },
        {
            -- heart
            x=1932,
            y=632,
            width=48,
            height=44,

            sourceX = 0,
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
            x=1932,
            y=228,
            width=108,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 106,
            sourceHeight = 106
        },
        {
            -- sound_on
            x=1932,
            y=116,
            width=108,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 106,
            sourceHeight = 106
        },
        {
            -- twitter_icon
            x=1932,
            y=4,
            width=108,
            height=108,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 106,
            sourceHeight = 106
        },
    },
    
    sheetContentWidth = 2048,
    sheetContentHeight = 2048
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
