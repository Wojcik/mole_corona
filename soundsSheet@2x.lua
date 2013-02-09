--
-- created with TexturePacker (http://www.texturepacker.com)
--
-- $TexturePacker:SmartUpdate:1b88937492eae22ef15e59e10690e7aa$
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
            -- sound_off
            x=106,
            y=0,
            width=106,
            height=106,

        },
        {
            -- sound_on
            x=0,
            y=0,
            width=106,
            height=106,

        },
    },
    
    sheetContentWidth = 212,
    sheetContentHeight = 106
}

SheetInfo.frameIndex =
{

    ["sound_off"] = 1,
    ["sound_on"] = 2,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
