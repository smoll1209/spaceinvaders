local input = require('input')
local state = require('state')
return function()
	local window_width, window_height = love.window.getMode()
	
	local entity = {}
	
	entity.draw = function(self)
		
		love.graphics.print(
				{{ 0.2, 1, 0.2, 1}, 'SCORE: ' .. state.score},
				10,
				10,
				0,
				2,
				2
			)
	
	end
	
	return entity
end
