
return {
	button_left = false,
	button_right = false,
	game_over = false,
	palette = {
		{1.0, 0.0, 0.0, 1.0},  -- red
    {0.0, 1.0, 0.0, 1.0},  -- green
    {0.4, 0.4, 1.0, 1.0},  -- blue
    {0.9, 1.0, 0.2, 1.0},  -- yellow
    {1.0, 1.0, 1.0, 1.0}  --white
  },
  stage = 1,
  paused = false,
  stage_cleared = false,
  bulletState = false,
  canShoot = true,
  bullet = false,
  shipX = 0, 
  speed = 10,
  stageWait = false,
  d = 0,
  score = 0,
  getX = false
}


