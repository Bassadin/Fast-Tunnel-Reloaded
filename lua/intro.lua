--FTR intro.lua

	intro = gamestate.new()
	
function intro:init()

	--Das Logo
		self.logo = lg.newImage("gfx/drlogo.png")
	
	--Der Ins-Hauptmenü-Wechsel-Timer
		self.timer = 0
		
	--Sekunden, bis ins Hauptmenü gewechselt wird
		self.changeTime = 4

end

function intro:update(dt)

	--Timer hochzählen
		self.timer = self.timer + dt
		
	--Ins Hauptmenü wechseln
		if self.timer >= self.changeTime then
			gamestate.switch(mainMenu)
		end

end

function intro:draw()

	--Logo
		lg.draw(self.logo, 0, 0)			

end

function intro:keypressed(key)

	if key == "return" or key == " " or key == "escape" then
		gamestate.switch(mainMenu)
	end

end