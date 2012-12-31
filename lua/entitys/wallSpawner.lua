--FTR player.lua
	wallSpawner = class:new()
	
function wallSpawner:init()

	--Wand-Table
		self.walls = {}
		
	--Aussehen
		self.wallHeight = 20		--Wandhöhe in Pixeln
		self.wallAberrance = 0
		
	--Spawntimer
		self.spawnTimer = 0
		
	--Bewegung
		self.speed = 450
		self.speedMax = 800
		self.speedIncreaseTimer = 0
		self.speedIncreaseRate = 20		--Wert, um den self.speed jede Sekunde zunimmt.

end

function wallSpawner:update(dt)

	--Timerupdate
		self.spawnTimer = self.spawnTimer + dt
		self.speedIncreaseTimer = self.speedIncreaseTimer + dt
		
	--Spawnen
		if self.spawnTimer > ( self.wallHeight / self.speed ) - 0.005 then			
			--Links spawnen
				local tempL = {
				
					x = 0,
					y = -self.wallHeight,
					w = utils:getLeftWallWidth(),
					h = self.wallHeight,
				
				}
			
			--Rechts spawnen			
				local tempR = {
			
				x = screenwidth - utils:getRightWallWidth(),
				y = -self.wallHeight,
				w = utils:getRightWallWidth(),
				h = self.wallHeight,
			
				}
				
			table.insert(self.walls, tempL)
			table.insert(self.walls, tempR)
			
			--Zufall
				local rand3 = math.random(-1, 1)
				local rand2 = math.random(0, 1)
					
				if self.wallAberrance < 7 and self.wallAberrance > -7 then
					if rand3 == -1 then
						self.wallAberrance = self.wallAberrance - 1
					elseif rand3 == 1 then
						self.wallAberrance = self.wallAberrance + 1
					end
				elseif self.wallAberrance == -7 and rand2 == 1 then
					self.wallAberrance = self.wallAberrance + 1
				elseif self.wallAberrance == 7 and rand2 == 1 then
					self.wallAberrance = self.wallAberrance - 1
				end
			
			self.spawnTimer = 0
			
		end
		
	--Bewegung
		for i,v in ipairs(self.walls) do
			v.y = v.y + self.speed * dt
		end
		
	--Wände löschen
		for i,v in ipairs(self.walls) do
			if v.y > screenheight then
				table.remove(self.walls, i)
			end
		end
		
	--Schneller werden		
		if self.speedIncreaseTimer >= 1  and self.speed <= self.speedMax + 0.01 then
			self.speed = self.speed + self.speedIncreaseRate
			self.speedIncreaseTimer = 0
		end
		
end

function wallSpawner:draw()

	lg.setColor(0, 0, 0, 255)
		for i,v in ipairs(self.walls) do
			lg.rectangle("fill", v.x, v.y, v.w, v.h)
		end
	lg.setColor(255, 255, 255, 255)
	
end

function wallSpawner:keypressed(key)



end