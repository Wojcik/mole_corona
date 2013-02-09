Sounds = {}

function Sounds:new()
	local sounds = {}
	sounds.backgroundMusic = audio.loadSound("mainTheme.mp3")

	function sounds:play()
		self.muted = false
		self.backgroundMusicChannel = audio.play( self.backgroundMusic, {loops=-1}  )
	end

	function sounds:stop()
		self.muted = true
		--audio.rewind()
		audio.stop()
	end

	function sounds:destroy()
		audio.dispose( self.backgroundMusic )
		self.backgroundMusic = nil
	end

	return sounds
end


