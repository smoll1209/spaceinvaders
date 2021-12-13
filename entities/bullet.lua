local state = require('state')
local world = require('world')

return function(x_pos, y_pos)
  local entity = {}
  
  entity.body = love.physics.newBody(world, x_pos, y_pos, 'dynamic')

  entity.body:setLinearVelocity( 0, -300)
  entity.shape = love.physics.newCircleShape(0, 0, 10)
  entity.fixture = love.physics.newFixture(entity.body, entity.shape)
  entity.fixture:setRestitution(0)
  entity.fixture:setUserData(entity)
	entity.health = 1
	
	entity.begin_contact = function(self)
		self.health = self.health - 1
		state.canShoot = true
		state.bullet = false
  end
	
  entity.draw = function(self)
    local self_x, self_y = self.body:getWorldCenter()
    love.graphics.circle('fill', self_x, self_y, self.shape:getRadius())
  end

  return entity
end

