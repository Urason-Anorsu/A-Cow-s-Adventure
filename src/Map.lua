-- map code

function map_setup()
	-- map tile settings
	wall = 0
	anim1 = 1
	anim2 = 2
	lose = 3
	win = 4
	se4 = 7
end

function draw_map()
	if stage >= 0 then
	cls()
	map(0,0,0,0,128,64)
	draw_trophies()
	end		
end

function ucamera()
	if p.x < 16 then
		camera(0,0)
		stage=0
	elseif p.x > 15 and p.x <= 31 then
		camera(128,0)
		stage = 1
	elseif p.x > 31 and p.x <= 47 then
		stage = 2
		camera(256,0)
	elseif p.x > 47 and p.x <= 63 then
		stage = 3
		camera(384,0)
	elseif p.x > 63 then
		stage = 4
		camera(512,0)
	end
end	


function is_tile(tile_type,x,y)
	tile=mget(x,y)
	has_flag=fget(tile,tile_type)
	return has_flag
end

function can_move(x,y)
	return not is_tile(wall,x,y)
end

