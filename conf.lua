--FTR conf.lua

function love.conf(t)
	
	--Titeleinstellungen
		t.title = "Fast Tunnel Reloaded"
		t.author = "Destructive Reality"
	
	--Bildschirmgröße und Grafikeinstellungen
		t.screen.fullscreen = false
		t.screen.width = 600		
		t.screen.height = 408
		t.screen.vsync = false
		t.screen.fsaa = 2
	
	--Kontrollmodule
		t.modules.joystick = false
		t.modules.audio = true
		t.modules.event = true
		t.modules.physics = false
		t.modules.sound = true
	
	--Filesystem
		t.identity = "Fast Tunnel Reloaded"
		
	--Anderes
		t.console = false
end