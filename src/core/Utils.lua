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

function stopTween(tween)
  assert("stop")
	if tween ~= nil then
		if tween.pause then tween:pause() end
		if tween.onComplete then tween.onComplete = nil end
		transition.cancel(tween)
	end
end