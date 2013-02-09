--
-- created with TexturePacker (http://www.texturepacker.com)
--
-- $TexturePacker:SmartUpdate:b16f8436a6390642f998aaeff8737456$
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
            -- beaver
            x=63,
            y=0,
            width=63,
            height=54,

        },
        {
            -- beaver_dead
            x=0,
            y=0,
            width=63,
            height=54,

        },
    },
    
    sheetContentWidth = 126,
    sheetContentHeight = 54
}

SheetInfo.frameIndex =
{

    ["beaver"] = 1,
    ["beaver_dead"] = 2,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
