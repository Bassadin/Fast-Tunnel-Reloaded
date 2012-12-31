--FTR gameover.lua
	
	gameover = gamestate.new()
	
function gameover:init()

	--Highscore speichern
		highscore.add("-", game.score)

end

function gameover:update(dt)

	

end

function gameover:draw()
			
	lg.setColor(0, 0, 0, 255)
		lg.setFont(countdownFont)
			lg.print("GAME OVER", 180, 20)
		lg.setFont(normalFont)
			lg.print("Your Score:", 220, 90)
		lg.setFont(scoreFont)
			lg.printf(game.score, screenwidth - 350, 170, 100, "center")
		lg.setFont(normalFont)
			lg.print("Press 'return' to return to Main Menu", 50, 350)
	lg.setColor(255, 255, 255, 255)
			
end

function gameover:keypressed(key)

	if key == "return" then
		gamestate.switch(mainMenu)
	end

end