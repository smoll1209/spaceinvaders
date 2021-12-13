local world = require('world')
local state = require('state')
local input = require('input')

return function(x_pos, y_pos, number)
  local window_width = love.window.getMode()
  -- properties
  local entity_speed = 15
  local entity_width = 50
  local entity_height = 50
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
		self.health = self.health - 1
  end
	
  entity.update = function(self)
    local self_x = self.body:getX()
    	 	
	 	if self_x > right_boundary then
	 		state.d = 0
 		elseif self_x < left_boundary then 
 			state.d = 1
		end
		
    if state.d == 1 then
    	self.body:setLinearVelocity(entity_speed*7, entity_speed)
  	else
		 	self.body:setLinearVelocity(-entity_speed*7, entity_speed)
	 	end

  end

  entity.draw = function(self)
  	love.graphics.setColor(state.palette[self.health] or state.palette[5])
    love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
    love.graphics.setColor(state.palette[5])
  end


  return entity
end
