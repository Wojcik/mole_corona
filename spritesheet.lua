--
-- created with TexturePacker (http://www.texturepacker.com)
--
-- $TexturePacker:SmartUpdate:0a64b8fb050cc01054594cd9b4fc4630$
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
            x=368,
            y=609,
            width=63,
            height=54,

        },
        {
            -- beaver_dead
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
            x=661,
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
            x=608,
            y=561,
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
            x=695,
            y=561,
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
            x=537,
            y=609,
            width=53,
            height=53,

        },
        {
            -- sound_on
            x=484,
            y=609,
            width=53,
            height=53,

        },
        {
            -- twitter_icon
            x=431,
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
    ["beaver_dead"] = 7,
    ["button_continue"] = 8,
    ["button_mainmenu"] = 9,
    ["button_pause"] = 10,
    ["button_play"] = 11,
    ["button_playagain"] = 12,
    ["fb_icon"] = 13,
    ["game_over"] = 14,
    ["heart"] = 15,
    ["shadow_back"] = 16,
    ["sound_off"] = 17,
    ["sound_on"] = 18,
    ["twitter_icon"] = 19,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
