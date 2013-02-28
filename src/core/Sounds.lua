require "src.core.Model"

Sounds = {}

function Sounds:new()
	local sounds = {}
	sounds.appear = audio.loadSound("assets/sounds/appear.wav")
	sounds.hit = audio.loadSound("assets/sounds/hit.wav")
	sounds.miss = audio.loadSound("assets/sounds/miss.wav")
	sounds.backgroundMusic = audio.loadSound("assets/sounds/bg.mp3")

	function sounds:play()
		self.backgroundMusicChannel = audio.play( self.backgroundMusic, {loops=-1}  )
	end

	function sounds:stop()
		audio.stop()
	end

	function sounds:playHit()
		if model.memento.soundOn then
			audio.play( self.hit )
		end
	end

	function sounds:playAppear()
		if model.memento.soundOn then
			audio.play( self.appear )
		end
	end

	function sounds:playMiss()
		if model.memento.soundOn then
			audio.play( self.miss )
		end
	end

	function sounds:destroy()
		audio.dispose( self.backgroundMusic )
		self.backgroundMusic = nil
	end

	return sounds
end


