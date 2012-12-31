--Verschiedene Funktionen
	
utils = {}

function utils:boxCollide(rect1, rect2) --Jeweils x, y, w und h benötigt
	
	local rect1x2 , rect1y2 , rect2x2 , rect2y2 = rect1.x + rect1.w, rect1.y + rect1.h, rect2.x + rect2.w , rect2.y + rect2.h
  
	return rect1.x < rect2x2 and rect1x2 > rect2.x and rect1.y < rect2y2 and rect1y2 > rect2.y
  
end

function utils:drawDebugQuad(rect)

	lg.setColor(255, 0, 0, 100)
		lg.rectangle("fill", rect.x, rect.y, rect.w, rect.h)
	lg.setColor(255, 255, 255, 255)
		
end

function utils:resetGame()

	game.countdown = 3
	game.countdownTimer = 0
	game.scoreTimer = 0
	game.score = 0
	player.x = screenwidth / 2 - ((player.playerImg:getWidth() * player.scale) / 2)
	player.y = screenheight - (player.playerImg:getHeight() * player.scale)
	game.state = "countdown" 
	wallSpawner.speedIncreaseTimer = 0
	wallSpawner.spawnTimer = 0
	wallSpawner.walls = {}
	wallSpawner.speed = 0
	intro.timer = 0
		
end

function utils:getLeftWallWidth()
	
	return 20*wallSpawner.wallAberrance + 200
	
end

function utils:getRightWallWidth()

	return -20*wallSpawner.wallAberrance + 200
end

return utils