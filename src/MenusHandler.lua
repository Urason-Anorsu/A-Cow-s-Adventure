-- stmenu,upmenu,death handler
function init_stmenu()
	stmenu = "on"
	upmenu = "off"
	menu = "start"
	stmcs = {}
	stmx = 5.2
	stmy = 7.3 -- base start value
	stmdist = 1.5
	stmtick = 0
end

function update_stmenu()
	if menu == "start" and btnp(❎) then
		menu = "difficulty"
		sfx(10)
	end
	if menu == "difficulty" then
		stmtick += 1
		stmdist = 1
		stmx=5.7
		if btnp(⬆️) then
			stmy -= stmdist
			sfx(9)
		end
		if btnp(⬇️) then
			stmy += stmdist
			sfx(9)
		end
		stmy=mid(8.5,stmy,10.5)
		if stmy ==9.5 then
		stmx=5.2
		end
	
		--select easy
		if stmy == 8.5 and stmtick > 7 then
			if btnp(❎) then
			sfx(10)
			menu = "char select"
			stmtick = 0
			stmx = 1
			stmy=9
			stmdist=3
			swap_diff("easy")
			end
		end
		--select medium
		if stmy == 9.5 and stmtick > 7 then
			if btnp(❎) then
				sfx(10)
				menu = "char select"
				stmtick = 0
				stmx = 1
				stmy=9
				stmdist=3
				swap_diff("medium")
			end
		end
		--select hard
		if stmy == 10.5 and stmtick > 7 then
			if btnp(❎) then
				sfx(10)
				menu = "char select"
				stmtick = 0
				stmx = 1
				stmy=9
				stmdist=3
				swap_diff("hard")
			end
		end
	end
	--character selection
	if menu == "char select" then
		stmtick +=1
		--selection movement
		if btnp(⬅️) then
			stmx -= stmdist
			sfx(9)
			if stmx <= 1 then
				stmy = 9
				stmdist = 3
			end
			if stmx == 4 then
				stmy = 11
				stmdist = 5
			end
			if stmx == 9 then
				stmy = 11
				stmdist = 5
			end
		end
		if btnp(➡️) then
			stmx += stmdist
			sfx(9)
			if stmx == 4 then
				stmy = 11
				stmdist=5
			end
			if stmx == 9 then
				stmy = 11
				stmdist=5
			end
			if stmx >=12 then
				stmx = 12
				stmy = 9
				stmdist=3
			end
		end
		stmx=mid(1,stmx,12)
		--white cow
		if stmx == 1 then
			if btnp(❎) and stmtick > 7 then
					stmenu="off"
					menu="game"
					sfx(10)
					swap_music(mgame)
			end
		end
		--strawberry cow
		if stmx == 4 then
			if btnp(❎) and stmtick > 7 then
				stmenu="off"
				strawberrycow()
				menu="game"
				sfx(10)
				swap_music(mgame)
			end
		end
		--gold cow
		if stmx == 9 then
			if btnp(❎) and stmtick > 7 then
				stmenu="off"
				goldcow()
				menu="game"
				sfx(10)
				swap_music(mgame)
			end
		end
		--robo cow
		if stmx == 12 then
			if btnp(❎) and stmtick > 7 then
				stmenu="off"
				robocow()
				menu="game"
				sfx(10)
				swap_music(mgame)
			end
		end
	end
end

function draw_stmenu()
	xspr = stmx*8
	yspr = stmy*8
	map(0,16,0,0,128,64)
	spr(152,xspr,yspr)
	spr(1,8,80)
	spr(36,32,96)
	spr(15,72,96)
	spr(31,96,80)
	if menu == "start" then
	spr(137,50,58)
	spr(138,58,58)
	spr(138,66,58)
	spr(138,68,58)
	print("start!",52,60)
	end
	if menu == "difficulty" then
	-- difficulty sign
	spr(137,40,58)
	spr(138,48,58)
	spr(138,56,58)
	spr(138,64,58)
	spr(138,72,58)
	spr(138,78,58)
	print ("difficulty:",42,60,6)
	-- easy sign
	spr(137,54,68)
	spr(138,62,68)
	spr(138,65,68)
	print ("easy",56,70,12)
	-- medium sign
	spr(137,50,76)
	spr(138,58,76)
	spr(138,64,76)
	spr(138,69,76)
	print("medium",52,78,9)
	--hard sign
	spr(137,54,84)
	spr(138,62,84)
	spr(138,65,84)
	print("hard",56,86,8)
	end
	if menu == "char select" then
	spr(137,28,58)
	spr(138,36,58)
	spr(138,42,58)
	spr(138,48,58)
	spr(138,54,58)
	spr(138,60,58)
	spr(138,66,58)
	spr(138,72,58)
	spr(138,78,58)
	spr(138,84,58)
	spr(138,90,58)
	print ("character select:",30,60,6)		
	end
end 


function init_upmenu()
	make_player()
	
	upmcs= {}
	ux = 36
	uy = 30 -- base start value
	udist = 24
	utick = 0
	sprtick = 0
	ubspr1 = 164 --poss del
	ubspr2 = 166 --poss del
 ubutx1 = 32
 ubutx2 = 40
	ubuta1y = 32
	ubutb1y = 56
	ubutc1y = 80
	uptick = 0
	udmg = 5
	uas = 4
	uheal = 1
end

function update_upmenu()
	utick +=1
	sprtick +=1
	--movement
	if btnp(⬆️) then
		uy -= udist
		sfx(9)
	end
	if btnp(⬇️) then
		uy += udist
		sfx(9)
	end
	uy=mid(30,uy,78)
	--scene changer
	if btnp(4) and utick >=10 then
			utick = 0
			menu = "game"
	end

	if btnp(❎) then 
		if uy == 30 then --damage
			sprtick = 0
			ubuta1y = 33
			if p.gold >= udmg and #dmgupgrades < 3 then --price
				p.gold -= udmg
				udmg +=5
				add(dmgupgrades,p.dmgupval)
				p.dmg += p.dmgupval*#dmgupgrades
				p.as += 3.5
				p.bulspr +=1
				sfx(12)
				 if p.bulspr >=180 then
				 	p.bulspr = 179
				 end
			end
		end
		if uy ==54 then --as
			sprtick = 0
			ubutb1y = 57
			if p.gold >= uas and #asupgrades < 3 then
				p.gold -= uas
				uas +=2
				add(asupgrades,p.asupval)
				p.as -=p.asupval*#asupgrades
				sfx(12)
			end	
		end
		if uy == 78 then -- heal
			sprtick = 0
			ubutc1y = 81
			if p.gold >= uheal then
				if p.hp <= 4 then
				p.gold -= uheal
				uheal +=1
				p.hp +=1
				sfx(12)
				end
			end
		end		
	end
	if sprtick > 5 then
		ubuta1y = 32
		ubutb1y = 56
		ubutc1y = 80
		sprtick = 0
	end
	
end

function draw_upmenu()
	if menu == "upgrade" then
	--background
		cls()
		camera(0,0)
		map(32,16,0,0,128,64)
		--top button damage
		print(udmg,50,ubuta1y)
		spr(ubspr1,ubutx1,ubuta1y)
		spr(ubspr2,ubutx2,ubuta1y)
		--middle button
		print(uas,50,ubutb1y)
		spr(ubspr1,ubutx1,ubutb1y)
		spr(ubspr2,ubutx2,ubutb1y)
		--bottom button
		print(uheal,50,ubutc1y)
		spr(ubspr1,ubutx1,ubutc1y)
		spr(ubspr2,ubutx2,ubutc1y)
		--selection
		spr(152,ux,uy)
		end
		--coin
		spr(coinspr,96,24)
		coinspr +=0.15
		if coinspr >= 137 then
			coinspr = 128
		end
		print(p.gold,98,34)
end



function udeath()
	palive += 1
end

function draw_death()
	if palive == 1 then
		swap_music(mdead)
		cls()
		camera(0,0)
		map(16,16,0,0,128,64)
		p.x = 1000
		p.y = 1000
	end
	if palive > 4 then
		print("game over!",44,64,8)
	end
	if palive == 58 then--52 then
	run()
	end
end



function swap_diff(dhold)
	difficulty = dhold
	if difficulty == "easy" then
		diff = 
		{
			0,
			0.5,
			0,
			2,
			0,
		}
	end
	if difficulty == "medium" then
		--25% harder than base
		diff =
		{
			0.105, --bonus ms
			0.5, --bonus damage
			0.105, -- bonus rspwn timer
			4, --bonus enemies 
			0, --gold change
		}
	end
	if difficulty == "hard" then
		-- 50% harder than base
		diff =
		{
			0.126, --bonus ms
			1, --bonus damage
			0.126, -- bonus rspwn timer
			6, --bonus enemies 
			0, --gold change
		}
	end
end

function uend_game()
	endtick += 1
end

function dend_game()
	cls()
	camera(0,0)
	map(49,16,0,0,128,64)
	if endtick > 10 then
	print("victory!",48,60,11)
	end
	if endtick > 30 then
	print("you've added to your farm!",10,72,6)
	end
	if endtick >= 70 then
		sfx(12)
		if difficulty == "easy" and p.token == "whitecow" then
			spr(14,60,82)
			dset(1,1)
		end
		if difficulty == "easy" and p.token == "strawberrycow" then
			spr(243,60,82)
			dset(2,1)
		end
		if difficulty == "easy" and p.token == "goldcow" then
			spr(244,60,82)
			dset(3,1)
		end
		if difficulty == "easy" and p.token == "robocow" then
			spr(245,60,82)
			dset(4,1)
		end
		if difficulty == "medium" and p.token == "whitecow" then
			spr(230,60,82)
			dset(5,1)
		end
		if difficulty == "medium" and p.token == "strawberrycow" then
			spr(233,60,82)
			dset(6,1)
		end
		if difficulty == "medium" and p.token == "goldcow" then
			spr(234,60,82)
			dset(7,1)
		end	
		if difficulty == "medium" and p.token == "robocow" then
			spr(235,60,82)
			dset(8,1)
		end		
		if difficulty == "hard" and p.token == "whitecow" then
			spr(231,60,82)
			dset(9,1)
		end			
		if difficulty == "hard" and p.token == "strawberrycow" then
			spr(240,60,82)
			dset(10,1)
		end
		if difficulty == "hard" and p.token == "goldcow" then
			spr(241,60,82)
			dset(11,1)
		end
		if difficulty == "hard" and p.token == "robocow" then
			spr(242,60,82)
			dset(12,1)
		end
		
	if endtick > 160 then
		print("press ❎ to continue",26,92)
		if btnp(❎) then
			run()
		end
	
	end
end
	
	
	
	
	
	
end
		