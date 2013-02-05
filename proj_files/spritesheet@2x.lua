--
-- created with TexturePacker (http://www.texturepacker.com)
--
-- $TexturePacker:SmartUpdate:1acd9832c7b2aa46b6cf3e640cece814$
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
            y=930,
            width=960,
            height=74,

        },
        {
            -- back_middle_b
            x=960,
            y=640,
            width=960,
            height=196,

        },
        {
            -- back_middle_t
            x=960,
            y=836,
            width=960,
            height=190,

        },
        {
            -- back_top
            x=0,
            y=640,
            width=960,
            height=290,

        },
        {
            -- background_menu
            x=960,
            y=0,
            width=960,
            height=640,

        },
        {
            -- beaver
            x=1794,
            y=1026,
            width=126,
            height=108,

        },
        {
            -- button_continue
            x=1268,
            y=1026,
            width=526,
            height=96,

        },
        {
            -- button_mainmenu
            x=650,
            y=1122,
            width=566,
            height=96,

        },
        {
            -- button_pause
            x=1216,
            y=1122,
            width=68,
            height=68,

        },
        {
            -- button_play
            x=0,
            y=1004,
            width=650,
            height=218,

        },
        {
            -- button_playagain
            x=650,
            y=1026,
            width=618,
            height=96,

        },
        {
            -- fb_icon
            x=1054,
            y=1218,
            width=106,
            height=106,

        },
        {
            -- game_over
            x=0,
            y=1222,
            width=736,
            height=118,

        },
        {
            -- heart
            x=1160,
            y=1218,
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
            -- sound_off
            x=948,
            y=1218,
            width=106,
            height=106,

        },
        {
            -- sound_on
            x=842,
            y=1218,
            width=106,
            height=106,

        },
        {
            -- twitter_icon
            x=736,
            y=1218,
            width=106,
            height=106,

        },
    },
    
    sheetContentWidth = 1920,
    sheetContentHeight = 1354
}

SheetInfo.frameIndex =
{

    ["back_bottom"] = 1,
    ["back_middle_b"] = 2,
    ["back_middle_t"] = 3,
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
