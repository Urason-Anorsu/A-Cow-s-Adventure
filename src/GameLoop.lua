--a cows adventure
--by urason




-- game loop

function _init()
		cartdata("urason_acowsadventure")
		init_stmenu()
		map_setup()
		make_player()
		ibullets()
		setup_enemies()
		setup_stage()
		init_upmenu()
		swap_diff()
		init_trophies()
		swap_music()
		init_dmgupgrades()
		init_asupgrades()
		gc_table()
		if stmenu == "on" then
			swap_music(start)
		end
end

function _update()
	if stmenu == "on" then
		update_stmenu()
	end
	if menu == "upgrade" then
		update_upmenu()
	end
	if menu == "dead" then
		udeath()
	end
	if menu == "victory" then
		uend_game()
	end
	if stmenu == "off" then --and palive == 0 then
		if menu== "game" then
		ucamera()
		move_player()
		update_as_timer()
		ubullets()
		uenemies()
		rngspawnticker()
		enlib()
		update_stage()
		ensptick()
		ucol()
		uhud()
		openshop()
		end
	end
end

function _draw()
	if stmenu == "on" then
	draw_stmenu()
	end
	if menu == "upgrade" then
		draw_upmenu()
	end
	if menu == "dead" then
		draw_death()
	end
	if menu == "victory" then
		dend_game()
	end
	if stmenu == "off" and menu == "game" then
	cls()
	draw_map()
	draw_player()
	denemies()
	dhud()
	dbullets()
	attack()
	uplayer()
	rendstage()
	end
end
