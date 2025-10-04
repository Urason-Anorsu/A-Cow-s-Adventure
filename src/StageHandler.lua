--stage handler

function setup_stage()
	shoptick=0
	endtick=0
	stagetick=0
	stage = 0
	ycap = 17
	palive = 0
	door = 30
	spawntick = 0
	globalticker = 0
	coinspr = 128
	ecounter = 0
	stgstat = {false,false,false,false,false}
	stg={
			{ -- stage 1
				248,-- x
				0.2, --ms
				10, --hp 
				0.5, --dmg
				0.275, --rspwn timer
				8, -- enemy cap 
				46,--door
				0,--gold rnd + 1
				136,--arena door x
				82,--arena door sprite
				248,--blocker
				"locked",--next stg state
			},
			{ -- stage 2
				376,-- x
				0.24, --ms
				10, --hp
				0.5, --dmg
				0.2475, --rspwn timer
				10, -- enemy cap
				62,--door
				0,--gold rnd + 1
				264,--arena door x
				150,--arena door sprite
				376,--blocker
				"locked",--next stg state
			},
			{ -- stage 3
				504,-- x
				0.39, --ms
				10, --hp
				0.5, --dmg
				0.4025, --rspwn timer
				12, -- enemy cap
				78,--door
				0,--gold rnd + 1
				392,--arena door x
				3,--arena door sprite
				504,--blocker
				"locked",--next stg state
			},
			{ -- stage 4
				632,-- x
				0.5, --ms
				10, --hp
				0.5, --dmg
				0.575, --rspwn timer
				20, -- enemy cap
				199, --door
				0,--gold rnd + 1
				520,--arena door x
				228,--arena door sprite
				632,--blocker
				"locked",--next stg state
			},
		}
end



function update_stage()
	--enters player into combat
	if p.y == 12 and stgstat[stage] == false then
		vsound = 0
		p.incombat = 1
		ycap = 11
		spawntick = 35
		if p.incombat == 1 then
			if stage == 1 then
			swap_music(mcattle)
			elseif stage == 2 then
			swap_music(mwheat)
			elseif stage == 3 then
			swap_music(mbees)
			elseif stage == 4 then
			swap_music(mocean)
			end
		end
	elseif stgstat[stage]==true then
		p.incombat = 0
		door = stg[stage][7] --unlocks next lvl
	 if #enemies == 0 then
	 ycap = 17
	 stg[stage][12]  = "unlocked"
	 vsound += 1
	 	if vsound == 2 then
	 	sfx(14)
	 	end
	 	if vsound == 4 then
	 	swap_music(mgame)
	 	end
	 end
	end
	
end


function rendstage()
	if p.x == 80 then
		swap_music(start)
		menu = "victory"
	end
	if ycap < 17 then
			spr(stg[stage][10],stg[stage][9],96)
	end
if stage >0 then
	if stg[stage][12] == "unlocked" then
	--stage complete sign tbd
	end
	
	if stg[stage][12] == "locked" then
			spr(53,stg[stage][11],104)
			spr(53,stg[stage][11],112)
	end
end
	if stage == 0 then
		print("health!",12,10)

	end
	if stage == 4 then
	
	--mid sign--
	spr(90,564,0)--tleft
	spr(91,572,0)--tmiddle
	spr(92,580,0)--tright
	spr(106,564,8)--bleft
	spr(108,580,8)--bright

	end
end


function openshop()
	if p.incombat == 0 and count(enemies) == 0 then
		shoptick +=1
		if btnp(4) and shoptick >= 10 then
			shoptick = 0
	  menu = "upgrade"
	 end
	end
end

--not in update yet
function uglobalticker()
	globalticker += 1
	if globalticker >= 10 then
		
	elseif globalticker >= 20 then
		
	elseif globalticker >= 30 then
		
	elseif globalticker >= 40 then
		
	elseif globalticker >= 50 then
		
	end
	if globalticker > 100 then
		globalticker = 0
	end
end

function init_music()
	musictick = 0
end

-- music handler
function swap_music(mcurrent)
	start = 3
	mgame = 8
	mcattle= 0
	mwheat = 19
	mbees = 23
	mocean = 14
	mdead = 1
	music(mcurrent)
end

