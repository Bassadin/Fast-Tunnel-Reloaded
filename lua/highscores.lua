--FTR mainMenu.lua
	highscores = gamestate.new()
	
function highscores:init()



end

function highscores:update(dt)



end

function highscores:draw()

	lg.setColor(0, 0, 0, 255)
		lg.print("HIGHSCORES", 220, 5)
		lg.print("PRESS 'ESCAPE' TO GET BACK TO THE MAIN MENU", 15, screenheight - 30)
		lg.print("PRESS 'R' TO RESET HIGHSCORES", 100, screenheight - 60)
	
	for i, score, name in highscore() do
		love.graphics.print(i..".", 200, i * 29 + 10)
		love.graphics.print(score, 370, i * 29 + 10)
	end
	
	lg.setColor(255, 255, 255, 255)
		
end

function highscores:keypressed(key)

	if key == "escape" then
		gamestate.switch(mainMenu)
	elseif key == "r" then
		lf.remove("highscores.txt")
		highscore.set("highscores.txt", 10, "Nobody", 0)
	end

end