local entities = require('entities')
local bullet = require('entities/bullet')
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
	print(state.getX)
	print(state.shipX)
  if state.game_over or state.paused or state.stage_cleared then
    return
  end
  
  if state.bulletState then
  	entities[#entities+1] = bullet(state.shipX, 600)
  	state.bulletState = false
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

