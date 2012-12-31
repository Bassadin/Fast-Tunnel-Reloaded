--FTR credits.lua

	credits = gamestate.new()
	
function credits:init()



end

function credits:update(dt)



end

function credits:draw()

	--Credits
		lg.setColor(0, 0, 0, 255)
			lg.print("Graphics by:", 220, 70)
				lg.setFont(countdownFont)
					lg.print("Bastian Hodapp", 100, 100)
				lg.setFont(normalFont)
			lg.print("Code by:", 240, 180)
				lg.setFont(countdownFont)
					lg.print("Bastian Hodapp", 100, 210)
				lg.setFont(normalFont)
					lg.print("Press Escape for Main Menu", 110, 300)
		
		lg.setColor(255, 255, 255, 255)

end

function credits:keypressed(key)

	if key == "return" or key == " " or key == "escape" then
		gamestate.switch(mainMenu)
	end

end