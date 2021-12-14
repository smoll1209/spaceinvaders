local world = require('world')
local state = require('state')
local input = require('input')

return function(x_pos, y_pos, number)
  local window_width = love.window.getMode()
  -- properties
  local entity_speed = 50
  local entity_width = 60
  local entity_height = 30
	--window
	local left_boundary = (entity_width / 2) + 2
  local right_boundary = window_width - (entity_width / 2) - 2
  
	local entity = {}

  entity.body = love.physics.newBody(world, x_pos, y_pos, 'dynamic')
  entity.shape = love.physics.newRectangleShape(entity_width, entity_height)
  entity.fixture = love.physics.newFixture(entity.body, entity.shape)
  entity.fixture:setUserData(entity)

	 
  -- How many times the brick can be hit before it is destroyed
  entity.health = 1
  entity.type = 'alien'
  
 	
 	
  entity.begin_contact = function(self)
  	state.score = state.score + (100 * state.stage)
		self.health = self.health - 1
  end
	
  entity.update = function(self)
  
  	local speedMod = 1 + (state.stage /5)
    local self_x = self.body:getX()
 
	 	if self_x > right_boundary then
	 		state.d = 0
	 		state.speed = state.speed + state.stage
 		elseif self_x < left_boundary then 
 			state.d = 1
 			state.speed = state.speed + state.stage
		end
		
    if state.d == 1 then
    	self.body:setLinearVelocity(entity_speed * speedMod, state.speed)
  	else
		 	self.body:setLinearVelocity(-entity_speed * speedMod, state.speed)
	 	end

  end

  entity.draw = function(self)
  	love.graphics.setColor(state.palette[number] or state.palette[5])
    love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
    love.graphics.setColor(state.palette[5])
  end


  return entity
end
