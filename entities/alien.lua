local world = require('world')
local state = require('state')
local input = require('input')

return function(x_pos, y_pos, number)
  local window_width = love.window.getMode()
  local entity_speed = 30
  local entity_width = 50

  local entity_height = 50

  
local entity = {}

  entity.body = love.physics.newBody(world, x_pos, y_pos, 'dynamic')
  entity.shape = love.physics.newRectangleShape(entity_width, entity_height)
  entity.fixture = love.physics.newFixture(entity.body, entity.shape)
  entity.fixture:setUserData(entity)

	 
  -- How many times the brick can be hit before it is destroyed
  entity.health = 1
  entity.type = 'alien'
  
 	local d = 1
 	
  entity.begin_contact = function(self)
		self.health = self.health - 1
  end

  entity.update = function(self)
    self.body:setLinearVelocity(0, entity_speed)
  end

  entity.draw = function(self)
  	love.graphics.setColor(state.palette[self.health] or state.palette[5])
    love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
    love.graphics.setColor(state.palette[5])
  end


  return entity
end
