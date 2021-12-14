-- game specific entities
local ship = require('entities/ship')
local bullet = require('entities/bullet')
local alien = require('entities/alien')
local boundary = require('entities/boundary-bottom')
local roof = require('entities/roof')
local score = require('entities/score')
local i = 0

--These are all still fine
local pause = require('entities/pause-text')
local gameover = require('entities/game-over-text')
local stageclear = require('entities/stage-clear-text')

local entities = {
  ship(400, 950),
  boundary(600, 990),
  roof(600, 5),
  pause(),
  gameover(),
  stageclear(),
  score(100, 100)
}

local row_width = love.window.getMode() - 20
local color = 0

for number = 1, 4 do
	color = color + 1
	local alien_y =  number * 60
	for number = 1, 7 do
		local alien_x = ((number * 120) % row_width) 
		entities[#entities + 1] = alien(alien_x, alien_y, color)
	end
end

return entities

