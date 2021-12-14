local entities = require('entities')
local bullet = require('entities/bullet')
local alien = require('entities/alien')
local input = require('input')
local state = require('state')
local world = require('world')


 

love.draw = function()
  for _, entity in ipairs(entities) do
    if entity.draw then entity:draw() end
  end
end

love.focus = function(focused)
  input.toggle_focus(focused)
end

love.keypressed = function(pressed_key)

  input.press(pressed_key)
end

love.keyreleased = function(released_key)
  input.release(released_key)
end

love.update = function(dt)
	
  if state.game_over or state.paused or state.stageWait then
    return
  end
	
	if state.stage_cleared and not state.stageWait then
		local row_width = love.window.getMode() - 20
		local color = 0

		for number = 1, 4 do
			color = color + 1
			local alien_y =  number * 60
			for number = 1, 7 do
				local alien_x = ((number * 120) % row_width) 
				entities[#entities + 1] = alien(alien_x, alien_y, color)
			end
			state.canShoot = true
		end

		
		state.stage = state.stage + 1
		--entities.spawnAliens()
		print("On stage: " .. state.stage)
		state.stageWait = true
	end

	
	

  
  
  if state.bulletState then
  	entities[#entities+1] = bullet(state.shipX, 905)
  	state.bulletState = false
  	state.canShoot = false
	end
  
  local invasion = false

  local index = 1
  while index <= #entities do
    local entity = entities[index]
    if entity.type == 'alien' then invasion = true end
    if entity.update then entity:update(dt) end
    if entity.health and entity.health < 1 then
      table.remove(entities, index)
      entity.fixture:destroy()
    else
      index = index + 1
    end
  end
	
		state.stage_cleared = not invasion
    world:update(dt)
  end

