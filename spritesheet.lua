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
            y=467,
            width=480,
            height=37,

        },
        {
            -- back_middle_b
            x=481,
            y=321,
            width=480,
            height=98,

        },
        {
            -- back_middle_t
            x=481,
            y=420,
            width=480,
            height=95,

        },
        {
            -- back_top
            x=0,
            y=321,
            width=480,
            height=145,

        },
        {
            -- background_menu
            x=481,
            y=0,
            width=480,
            height=320,

        },
        {
            -- button_continue
            x=636,
            y=516,
            width=263,
            height=48,

        },
        {
            -- button_mainmenu
            x=326,
            y=565,
            width=283,
            height=48,

        },
        {
            -- button_pause
            x=610,
            y=565,
            width=34,
            height=34,

        },
        {
            -- button_play
            x=0,
            y=505,
            width=325,
            height=109,

        },
        {
            -- button_playagain
            x=326,
            y=516,
            width=309,
            height=48,

        },
        {
            -- fb_icon
            x=423,
            y=614,
            width=53,
            height=53,

        },
        {
            -- game_over
            x=0,
            y=615,
            width=368,
            height=59,

        },
        {
            -- heart
            x=900,
            y=516,
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
            x=369,
            y=614,
            width=53,
            height=53,

        },
    },
    
    sheetContentWidth = 961,
    sheetContentHeight = 679
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
