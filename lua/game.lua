--FTR game.lua
	game = gamestate.new()
	
function game:init()

	--Bilder
		self.overlay = lg.newImage("gfx/overlay.png")
		
	--Score
		self.score = 0
		self.sps = 50		--Score per Second
		self.scoreTimer = 0
		self.scoreAddRate = 0.2
		
	--Status
		self.state = "countdown" 	--Entweder game, pause oder countdown
		
	--Entitys
		player:init()
		wallSpawner:init()
		
	--Countdown
		self.countdown = 3
		self.countdownSpeed = 0.5
		self.countdownTimer = 0

end

function game:update(dt)

	--Entitys
		if self.state == "game" then
			player:update(dt)
			wallSpawner:update(dt)
		end
		
	--Countdown
		if self.state == "countdown" then
			self.countdownTimer = self.countdownTimer + dt
		end
		
		if self.state == "countdown" and self.countdown > 0 and self.countdownTimer >= self.countdownSpeed then
			self.countdown = self.countdown - 1
			self.countdownTimer = 0
		end
		
		if self.state == "countdown" and self.countdown == 0 then
			self.state = "game"
			self.countdown = 3
		end
		
		
	--Score
		if self.state == "game" then
			self.scoreTimer = self.scoreTimer + dt
		end
		
		if self.scoreTimer > self.scoreAddRate and self.state == "game" then
			self.score = self.score + self.sps * self.scoreAddRate
			self.scoreTimer = 0
		end	

end

function game:draw()

	--Entitys
		player:draw()
		wallSpawner:draw()
		
	--Countdown
		if self.state == "countdown" then
			lg.draw(self.overlay, 0, 0)
			lg.setFont(countdownFont)
				lg.setColor(0, 0, 0, 255)
					lg.printf(self.countdown, screenwidth / 2, screenheight / 2, 1, "center")
				lg.setColor(255, 255, 255, 255)
			lg.setFont(normalFont)
		end
		
	--Pause
		if self.state == "pause" then
			lg.draw(self.overlay, 0, 0)
			lg.setFont(countdownFont)
				lg.setColor(255, 0, 0, 255)
					lg.printf("Pause", screenwidth / 2, screenheight / 2 - 50, 5, "center")
			lg.setFont(normalFont)
				lg.print("Press 'return' to continue", 130, 300)
				lg.print("Press 'escape' again to return to Main Menu", 10, 330)
			lg.setColor(255, 255, 255, 255)
		end
	
		
	--Debug
		if debugMode == true then
			lg.setFont(smallFont)
				lg.setColor(255, 0, 0, 255)
					lg.print("player.x: "..player.x, 20, 20)
					lg.print("player.y: "..player.y, 20, 40)
					lg.print("Walls: "..#wallSpawner.walls, 20, 70)
					lg.print("self.score: "..self.score, 20, 100)
					lg.print("Speed: "..wallSpawner.speed, 20, 130)
				lg.setColor(255, 255, 255, 255)
			lg.setFont(normalFont)
		end

end

function game:keypressed(key)

	--Entitys
		if self.state == "game" then
			player:keypressed(key)
		end
		
	--Pause
		if self.state == "game" and key == "escape" then
			self.state = "pause"
		elseif self.state == "pause" and key == "return" then
			self.state = "countdown"
		elseif self.state == "pause" and key == "escape" then
			gamestate.switch(mainMenu)
		end
		
end

function game:focus(f)
	if f == false then
		self.state = "pause"
	end
end