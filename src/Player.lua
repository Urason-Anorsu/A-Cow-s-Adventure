-- player code

function make_player()
-- "whitecow" "base"
	p={}
		p.name= 1
		p.x=7
		p.y=13
		p.sprite=1
		p.hp=5
		p.dmg=1.25 
		p.as=13 --upgrade lowers this--
		p.acd=0
		p.rr=1
		p.ms=1
		p.incombat=0
		p.kills=0
		p.invul=0
		p.dtick=0
		p.gold=0
		p.bulspr=176
		p.goldmod=0
		p.token="whitecow"
		p.dmgupval = 0.625
		p.asupval = 0.4
end

function draw_player()
	if stage >=0 then
	spr(p.sprite,posx,posy)
	end
end

function move_player()
	newx=p.x
	newy=p.y
	
	
	if (btnp(⬅️,0)) or btnp(⬅️,1) then newx-=p.ms end
	if (btnp(➡️,0)) or btnp(➡️,1) then newx+=p.ms end
	if (btnp(⬆️,0)) or btnp(⬆️,1) then newy-=p.ms end
	if (btnp(⬇️,0)) or btnp(⬇️,1) then newy+=p.ms end
	
	if (can_move(newx,newy)) then

		p.x=mid(0,newx,door)
		p.y=mid(0,newy,ycap) --17 is border
	else
		sfx(0)
	end
end

function attack()
	posx = p.x*8
	posy = p.y*8
	if btnp(❎) then
		if (p.as > p.acd) return
			sfx(7)
			shoot(posx,posy)
			spr(210,posx,posy)
			p.acd = 0
	end
end

function update_as_timer()
	if p.as > p.acd then
		p.acd += 1
	end
end


function uplayer()
	if p.invul > 1 then
		p.dtick +=1
	end
	if p.dtick > 1 then
		posx += 2
		posy += 2
	end
	if p.dtick > 2 then
		posx -= 3
		posx -= 3
	end
	if p.dtick > 3 then
		p.sprite = p.name
		p.invul = 0
		p.dtick = 0
		posx +=2
		posy +=2
	end
	
end

function dhud()
--top 85,86,87
--mid 101,102,103
--bot 117,118,119
		
		-- left 33% hudspr
		spr(85,hgx-3,hgy-11)
		spr(101,hgx-3,hgy-3)
		spr(117,hgx-3,hgy+5)
		
		-- mid 33% hudspr
		spr(86,hgx+5,hgy-11)
		spr(102,hgx+5,hgy-3)
		spr(118,hgx+5,hgy+5)

		-- right 33% hudspr
		spr(87,hgx+13,hgy-11)
		spr(103,hgx+13,hgy-3)
		spr(119,hgx+13,hgy+5)
		print (p.gold,hgx,hgy-1,12)
		print (p.kills,hgx+12,hgy-1,12)
	
		-- gold spr
		spr(coinspr,hgx-1,hgy-10)
		coinspr +=0.15
		if coinspr >= 137 then
			coinspr = 128
		end
	
	 -- health spr
	 if p.hp == 5 then
		spr(209,hhpx,hhpy)
		spr(209,hhpx+8,hhpy)
		spr(209,hhpx+16,hhpy)
		spr(209,hhpx+24,hhpy)
		spr(209,hhpx+32,hhpy)
		elseif p.hp == 4.5 then
		spr(209,hhpx,hhpy)
		spr(209,hhpx+8,hhpy)
		spr(209,hhpx+16,hhpy)
		spr(209,hhpx+24,hhpy)
		spr(224,hhpx+32,hhpy)	
		elseif p.hp == 4 then
		spr(209,hhpx,hhpy)
		spr(209,hhpx+8,hhpy)
		spr(209,hhpx+16,hhpy)
		spr(209,hhpx+24,hhpy)
		elseif p.hp == 3.5 then
		spr(209,hhpx,hhpy)
		spr(209,hhpx+8,hhpy)
		spr(209,hhpx+16,hhpy)
		spr(224,hhpx+24,hhpy)
		elseif p.hp == 3 then
		spr(209,hhpx,hhpy)
		spr(209,hhpx+8,hhpy)
		spr(209,hhpx+16,hhpy)
		elseif p.hp == 2.5 then
		spr(209,hhpx,hhpy)
		spr(209,hhpx+8,hhpy)
		spr(224,hhpx+16,hhpy)
		elseif p.hp == 2 then
		spr(209,hhpx,hhpy)
		spr(209,hhpx+8,hhpy)
		elseif p.hp == 1.5 then
		spr(209,hhpx,hhpy)
		spr(224,hhpx+8,hhpy)
		elseif p.hp == 1 then
		spr(209,hhpx,hhpy)
		elseif p.hp == 0.5 then
		spr(224,hhpx,hhpy)
		elseif p.hp <= 0 then
			menu = "dead"
		end
end

function uhud()
	hud={}
	hgx = 99 + (128*stage)
	hgy = 11 --2
	hhpx = 5 + (128*stage)
	hhpy = 1

	if stage == 0 then
		hhpx +=1
	end
	if stage == 1 then
		hhpx +=0
		hhpy -=1
	end	
	if stage == 2 then
		hhpx+=0.5
		hhpy-=0.5	
	end
	if stage == 3 then
		hhpx +=0
		hhpy -=0
	end
end

function init_dmgupgrades()
	dmgupgrades = {}

end

function init_asupgrades()
	asupgrades = {}
end