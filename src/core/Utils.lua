function protect_table (tbl)
  return setmetatable ({},
    {
    __index = tbl,  -- read access gets original table item
    __newindex = function (t, n, v)
       error ("attempting to change constant " ..
             tostring (n) .. " to " .. tostring (v), 2)
      end -- __newindex
    })

end -- function protect_table

function showProps(o)
	print("-- showProps --")
	print("o: ", o)
	for key,value in pairs(o) do
		print("key: ", key, ", value: ", value);
	end
	print("-- end showProps --")
end

--from http://developer.coronalabs.com/code/vector-bitmap-masking-snippet-app
function createMask(name, width, height)
	print(name, width, height)
	-- let's make a "mask" group for our vector...
	local dynamicMask = display.newGroup()
	-- paint a screen sized background white and put it in the group.
	local thisRect = display.newRect (0,0, width, height)
	thisRect:setFillColor(0,0,0)
	dynamicMask:insert(thisRect);

	local thisRect = display.newRect (0,0, width/2, height/2)
	thisRect:setFillColor(255,255,255)
	dynamicMask:insert(thisRect);
	-- you could add addition vector objects here to create a complex mask.
	-- now the magic:
	display.save (dynamicMask, name,  system.TemporaryDirectory)
	-- we don't need no stickin' badges -- get rid of the group.
	dynamicMask:removeSelf();
	print(dynamicMask.width, dynamicMask.height)
end