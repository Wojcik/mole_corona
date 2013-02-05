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
            y=465,
            width=480,
            height=37,

        },
        {
            -- back_middle_b
            x=480,
            y=320,
            width=480,
            height=98,

        },
        {
            -- back_middle_t
            x=480,
            y=418,
            width=480,
            height=95,

        },
        {
            -- back_top
            x=0,
            y=320,
            width=480,
            height=145,

        },
        {
            -- background_menu
            x=480,
            y=0,
            width=480,
            height=320,

        },
        {
            -- beaver
            x=897,
            y=513,
            width=63,
            height=54,

        },
        {
            -- button_continue
            x=634,
            y=513,
            width=263,
            height=48,

        },
        {
            -- button_mainmenu
            x=325,
            y=561,
            width=283,
            height=48,

        },
        {
            -- button_pause
            x=608,
            y=561,
            width=34,
            height=34,

        },
        {
            -- button_play
            x=0,
            y=502,
            width=325,
            height=109,

        },
        {
            -- button_playagain
            x=325,
            y=513,
            width=309,
            height=48,

        },
        {
            -- fb_icon
            x=527,
            y=609,
            width=53,
            height=53,

        },
        {
            -- game_over
            x=0,
            y=611,
            width=368,
            height=59,

        },
        {
            -- heart
            x=580,
            y=609,
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
            -- sound_off
            x=474,
            y=609,
            width=53,
            height=53,

        },
        {
            -- sound_on
            x=421,
            y=609,
            width=53,
            height=53,

        },
        {
            -- twitter_icon
            x=368,
            y=609,
            width=53,
            height=53,

        },
    },
    
    sheetContentWidth = 960,
    sheetContentHeight = 677
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
