--bullet & enemies code
function tbuls()
	ibullets()
	setup_enemies()
end
function ibullets()
	buls={}
end

function ubullets()
	for b in all(buls) do
		b.x=b.x+b.ms
		b.tick +=b.ms
		if b.tick > 107 then
			del(buls,b)
			end
	end
	
end
		
function dbullets()	
		for b in all(buls) do
			spr(p.bulspr,b.x+6,b.y)
		end
end

function shoot(posx,posy)
	add(buls,{
		x=posx,
		y=posy,
		ms=0.75,--(1.5)-(p.as*0.05),
		tick=0,
		dmg=1,
	})
	
end


function ucol()

	for b in all(buls) do
		for e in all(enemies) do
			if encol(e,b) then
			e.hp -= p.dmg
			sfx(3)
			del(buls,b)
			end
		end
	end
end	

function encol(c,d)
	
	local c_left = c.x
	local c_top = c.y
	local c_right = c.x+7
	local c_bottom = c.y+7

	local d_left = d.x
	local d_top = d.y
	local d_right = d.x+7
	local d_bottom = d.y+7

	if c_top > d_bottom then
		return false
		end
		
	if d_top > c_bottom then
		return false
		end
	
	if c_left > d_right then
		return false
		end

	if d_left > c_right then
		return false
		end
	
	return true
end