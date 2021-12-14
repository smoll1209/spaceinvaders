local world = require('world')
local state = require('state')

return function(x_pos, y_pos)
	local entity = {}
	entity.body = love.physics.newBody(world, x_pos, y_pos, 'static')
	entity.shape = love.physics.newRectangleShape(1300, 10)
	entity.fixture = love.physics.newFixture(entity.body, entity.shape)
	entity.fixture:setUserData(entity)



	return entity 
end
