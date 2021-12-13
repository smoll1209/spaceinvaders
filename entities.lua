-- game specific entities
local ship = require('entities/ship')
local bullet = require('entities/bullet')
local alien = require('entities/alien')
local boundary = require('entities/boundary-bottom')
local roof = require('entities/roof')
local i = 0

--These are all still fine
local pause = require('entities/pause-text')
local gameover = require('entities/game-over-text')
local stageclear = require('entities/stage-clear-text')

local entities = {
  ship(400, 700),
  boundary(400, 750),
  roof(400, 10),
  pause(),
  gameover(),
  stageclear()
}

local row_width = love.window.getMode() - 20

for number = 1, 3 do
	local alien_y =  number * 120
	for number = 1, 5 do
		local alien_x = ((number * 120) % row_width) 
		entities[#entities + 1] = alien(alien_x, alien_y, number)
	end
end

return entities

