mainMenu = gamestate.new()
	
function mainMenu:init()

	--self.logo = lg.newImage("gfx/menu/mainLogo.png")
	
	--Buttons
		buttons = {}
		buttonPressed = nil

end

function mainMenu:update(dt)

	

end

function mainMenu:draw()

	
			

end

function mainMenu:keypressed(key)

	--Schlieﬂen mit escape
		if key == "escape" then
			highscore.save()
			love.event.push('quit') 
		end

end