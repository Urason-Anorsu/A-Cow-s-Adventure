-- class & trophy handler
function strawberrycow()
		p.name = 36
		p.sprite=36
		p.hp=4
		p.dmg=1
		p.as=9--9.5 --upgrade lowers this--
  p.token = "strawberrycow"
  p.dmgupval = 0.25 
		p.asupval = 0.16
end

function robocow()
	p.name = 31
	p.sprite =31
	p.hp=3
	p.dmg=2.5
	p.as=26
	p.token = "robocow"
	p.dmgupval = 1.5 -- divide by 1.56 for as
	p.asupval = 0.96
end
function goldcow()
	p.name = 15
	p.sprite=15
	p.hp=flr(rnd(5)+1)
	p.dmg=rnd(gcdmg)
	p.as=rnd(gcas)
	p.goldmod= 1
	p.token = "goldcow"
	if p.dmg == 1.1 then
		p.dmgupval = 0.3
	end
	if p.dmg == 1.25 then
		p.dmgupval = 0.625
	end
	if p.dmg == 0.9 then
		p.dmgupval = 0.25
	end
	if p.dmg == 2.5 then
		p.dmgupval = 1.5
	end
	if p.as == 11.5 then
		p.asupval = 0.3
	end
	if p.as == 13 then
		p.asupval = 0.4
	end
	if p.as == 9.5 then
		p.asupval = 0.16
	end
	if p.as == 26 then
		p.asupval = 0.96
	end
end

function gc_table()

	gcdmg={1.1,1.25,0.9,2.5}
	gcas={11.5,13,9,21}
	
end





function init_trophies()

	trophy1 = dget(1)
	trophy2 = dget(2)
	trophy3 = dget(3)
	trophy4 = dget(4)
	trophy5 = dget(5)
	trophy6 = dget(6)
	trophy7 = dget(7)
	trophy8 = dget(8)
	trophy9 = dget(9)
	trophy10 = dget(10)
	trophy11 = dget(11)
	trophy12 = dget(12)
end

function draw_trophies()
	if trophy1 == 1 then
		spr(14,48,64)
	end
	if trophy2 == 1 then
		spr(243,40,72)
	end
	if trophy3 == 1 then
		spr(244,48,80)
	end
	if trophy4 == 1 then
	 spr(245,56,72)
	end
	if trophy5 == 1 then
		spr(230,96,32)
	end
	if trophy6 == 1 then
		spr(233,88,40)
	end
	if trophy7 == 1 then
		spr(234,96,48)
	end
	if trophy8 == 1 then
		spr(235,104,40)
	end
	if trophy9 == 1 then
		spr(231,96,64)
	end
	if trophy10 == 1 then
		spr(240,88,72)
	end
	if trophy11 == 1 then
		spr(241,96,80)
	end
	if trophy12 == 1 then
		spr(242,104,72)
	end
	
end