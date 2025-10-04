-- enemies
function setup_enemies()
	enemies={}

end

function spawne()
	ecounter += 1
	add(enemies,{
		x=stg[stage][1]+24,
		y=o*8,
		ms=stg[stage][2]+diff[1],
		hp=stg[stage][3],
		dmg=stg[stage][4]+diff[2],
		gold=(flr(rnd(stg[stage][8]))+1)+diff[5],
		tick=0,
		warn=0,
		warnx=stg[stage][1],
		atick=0,
		sprite=rnd(esprites[stage]),
		hpspr=71
		})
end

function uenemies()
	for e in all(enemies) do
		e.x=e.x-e.ms
		e.tick +=e.ms
	 e.warn += e.ms
	 -- bullet reg
		if e.hp <= 0 then 
			e.atick+=5
			if stage == 1 then
			e.sprite=22
			end
			if stage == 2 then
			e.sprite = 21
			end
			if stage == 3 then
			e.sprite = 184
			end
			if stage == 4 then
			e.sprite=8
			end
			if e.atick > 20 then
			del(enemies,e)
			sfx(2)
			p.gold += e.gold+p.goldmod
			p.kills +=1
		end
  -- e die x limit
		elseif e.tick > 130 then --e.x < stg[stage][1]-100 then
			p.hp-=e.dmg
			del(enemies,e)
			p.invul = 2
			p.sprite = 2
			sfx(8)
		end
	
	end 
end
function denemies()
	for e in all(enemies) do
		spr(e.sprite,e.x,e.y)
		spr(e.hpspr,e.x+0.5,e.y+1)
		if e.warn > 0 then
			if e.warn < 17 then
			spr(61,e.warnx-1,e.y)
			end
		end
		if e.hp > 8 then
			e.hpspr = 72
		elseif e.hp > 6 then
			e.hpspr = 73		
		elseif e.hp > 4 then
			e.hpspr = 74
		elseif e.hp > 2 then
			e.hpspr = 75
		elseif e.hp >= 1 then
			e.hpspr = 76
		end		
				
	end
end

function rngspawnticker() --prob add gamestate checker here--
	o = flr(rnd(8))+3
end

	
function enlib()
	esprites={
		{29,45,140},--stage 1
		{67,68,70},--stage 2
		{80,96,211},--stage 3
		{37,38,39},--stage 4
		}
end

function ensptick()
	if p.incombat == 1 then
		
		spawntick += stg[stage][5] +diff[3]
		if spawntick > 40 then
			if ecounter < (stg[stage][6]+diff[4]) then
			spawne()
			spawntick = 0
			end
		end
	if ecounter >= stg[stage][6]+diff[4] then -- numcap
			stgstat[stage] = true
			ecounter = 0
			p.incombat = 0
	end
	end
end
