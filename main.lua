--FTR main.lua

--Libraries
	gamestate = require "libs/gamestate"	--Hump.Gamestate
	class = require "libs/class"			--Hump.Class	
	require "libs/sick"						--SICK(Highscores)
	
--Requires
	require "lua/game"
	require "lua/highscores"
	require "lua/mainMenu"
	require "lua/entitys/player"
	require "lua/entitys/wallSpawner"
	require "lua/utils"
	require "lua/gameover"
	require "lua/intro"
	require "lua/credits"
	
--Shortcuts
	lg = love.graphics
	lkid = love.keyboard.isDown
	lf = love.filesystem
	
--Randomseed
	math.randomseed(os.time())
	
--Bildschirm
	screenwidth = lg.getWidth()
	screenheight = lg.getHeight()
	
function love.load()

	--Version
		version = "1.0"
	
	--Debug
		debugMode = false
		
	--Default Image Filter
		lg.setDefaultImageFilter("nearest", "nearest")

	--Background-Farbe
		love.graphics.setBackgroundColor(160, 250, 150)
	
	--Erster Gamestate
		gamestate.switch(credits)
		gamestate.init()
		
	--Standartfont laden
		tinyFont = lg.newFont("font/pixel.ttf", 8)
		smallFont = lg.newFont("font/pixel.ttf", 16)
		normalFont = lg.newFont("font/pixel.ttf", 24)
		countdownFont = lg.newFont("font/pixel.ttf", 48)
		scoreFont = lg.newFont("font/pixel.ttf", 96)
		
		lg.setFont(normalFont)
		
	--SICK
		highscore.set("highscores.txt", 10, "-", 0)
		

end

function love.update(dt)

	--Gamestate-Lib
		gamestate.update(dt)

end

function love.draw()

	--Gamestate-Lib
		gamestate.draw()
		

end

function love.keypressed(key)

	--Gamestate-Lib
		gamestate.keypressed(key)

end

function love.quit()
	highscore.save()
end

function love.quit()
	game:focus(f)
end