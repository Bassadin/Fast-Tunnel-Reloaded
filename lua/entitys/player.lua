--FTR player.lua
	player = class:new()
	
function player:init()

	--Bild
		self.playerImg = lg.newImage("gfx/player.png")
		
	--Skalierung
		self.scale = 3
		
	--Position und Größe
		self.x = screenwidth / 2 - ((self.playerImg:getWidth() * self.scale) / 2)
		self.y = screenheight - (self.playerImg:getHeight() * self.scale)
		
	--Bewegung
		self.speed = 430
		
	--Hitbox
		self.hitbox = {
						x = self.x + 3,
						y = self.y + 2,
						w = 18,
						h = 12,	
						
						}

end

function player:update(dt)

	--Hitbox
		self.hitbox = {
						x = self.x + 3,
						y = self.y + 2,
						w = 18,
						h = 12,	
						
						}
						
	--Kollision mit den Walls
		for i,v in ipairs(wallSpawner.walls) do
			if utils:boxCollide(self.hitbox, {x = v.x, y = v.y, w = v.w, h = v.h}) then
				gamestate.switch(gameover)
			end
		end	
	
	--Bewegung	
		if lkid("left") and self.x > 0 then
			self.x = self.x - self.speed * dt
		elseif lkid("right") and self.x < screenwidth - (self.playerImg:getWidth() * self.scale) then
			self.x = self.x + self.speed * dt
		end
		
	--Sicherheitsreset
		if self.x < 0 then
			self.x = 0
		elseif self.x > screenwidth - (self.playerImg:getWidth() * self.scale) then
			self.x = screenwidth - (self.playerImg:getWidth() * self.scale)
		end

end

function player:draw()

	--Zeichnet den Spieler
		lg.draw(self.playerImg, self.x, self.y, math.rad(0), self.scale, self.scale)
		
	--Debug
		if debugMode == true then
			--utils:drawDebugQuad(self.hitbox)
		end

end

function player:keypressed(key)

	

end