pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
-- mandatory

function _init()
	create_player() 
	init_msg()
end

function _update()
	if not messages[1] then
		player_movement()
	end
	woof()
	var()
	down()
	up()
	obstacle()
	didacticiel()
	update_msg()
	update_camera()
end

function _draw()
	cls()
	draw_map()
	draw_player()
	draw_msg()
	draw_var()
end
-->8
-- map et camera

-- map

map_start=0
map_end=256


function draw_map()
	map (50,50,0,0,128,64)
end

function check_flag(flag,x,y)
	local sprite=mget(x,y)
	return fget(sprite,flag)
end


-- camera

function update_camera()
 camx=mid(0,p.x-7.5,31-15)
 camy=mid(0,p.y-7.5,31-15)
 camera(camx*8,camy*8)
end

-- mid(... 31-15)
--31:taille max de la carte
--mettre un y fixe
-->8
-- player + woof

function create_player()
	p={x=6,y=2,sprite=16}
end

function player_movement()
	newx=p.x
	newy=p.y
	
	p.x+=newx+0.000000001
	
end

function draw_player()
	spr(p.sprite,p.x*8,p.y*8)
end

-- commandes sons

function woof()
 if (btnp(⬅️)) sfx(0) 
 if (btnp(⬆️)) sfx(1)
 if (btnp(⬇️)) sfx(2)
 if (btnp(➡️)) sfx(3)
end

-- !regler les commandes
-- haut bas : sons, dg bouger
-- x passer les msgs
-->8
-- actions

-- fonction action descendre

function down()
	if (btn(4)) then --a enlever
	repeat 
		newy+=1
		newx=p.x
	until check_flag(0,newx,newy+1)
		p.x=newx
		p.y=newy
	end
end

-- fonction action monter

function up()
if (btn(4)) then -- a enlever
	repeat 
		newy-=1
		newx=p.x
	until check_flag(0,newx,newy+1)
		p.x=newx
		p.y=newy
	end
end
-->8
-- flags

function obstacle()
	if check_flag(1,newx,newy) then
	create_msg("aveugle",
	"on s'arrete, que dois-je \nfaire?")
	end
	-- + modif sprite (medor assis)
end

function didacticiel()
	if check_flag(2,newx,newy) then
	create_msg("dida",
	"consignes")
	end
end 
	
-->8
-- messages

function init_msg()
	messages ={}
end

function create_msg(name,...)
	msg_title=name
	messages={...}
end

function update_msg()
	if (btn(❎)) then
		deli(messages,1)
	end
end

function draw_msg()
	if messages[1] then
		local y=100
		if p.y%16>9 then
		y=10
		end
		rectfill(3,y+8,124,y+24,4)
		rect(3,y+8,124,y+24,2)
		print(messages[1],6,y+11,15)
	end
end


-->8
-- fonctions signal

a="a"
b="b"
c="c"
d="d"

function var()
 if (btnp(⬅️)) then a=1 end
 if (btnp(⬆️)) then b=2 end
 if (btnp(⬇️)) then c=3 end
 if (btnp(➡️)) then d=4 end
 notes=a..b..c..d
end

function draw_var()
 print(notes,10,2,7)
end
-- coordonnes du print hors
-- du cadre





	

__gfx__
0000000044444444333333338800008866666666555555550000000057777775666666660eeee000eeee00000000000057777775eeeeeeee1111111100000000
0000000044444444333333330080088076777776dddddddd0000000056666665567777750f5f5000f5f50000000000005eeeeee5fefffffe1eeeeeee00000000
0070070033333333333333330008800076777776fefffffe500000005dddddd5567777750ffef000ffef00000000000058888885fefffffe1e11eee100000000
0007700033333333333333330008800076777776fefffffe50000000511111155dddddd533333400333304000000000052222225fefffffe1e111e1100000000
0007700033333333333333330080080066666666eeeeeeee600000005777777551111115f3333454f33454000000000057777775eeeeeeee1e11111100000000
0070070033333333333333330080008077776777ffffefff000000005666666557777775fc444444fcc44440000000005eeeeee5ffffefff1e11111100000000
0000000033333333333333330800000877776777ffffefff000000005dddddd55dddddd504444400c00c04440000000058888885ffffefff1e11111100000000
0000000088888888333333338000000066666666eeeeeeee0000000051111115511111150c40c400c00c44440000000052222225eeeeeeee1e11e1e100000000
00999900000000000099990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09000090000000000999999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
90000009000000009919919900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
90900909000000009999999900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
90000009000000009599995900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
90000009000000009955559900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09000090000000000998899000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00999900000000000099990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111111111111111111110000000000000000000000006666666600000000000000000000000000000000
17777777777777777777777777777777777777777777777777777777777777710000000000000000000000007677777600000000000000000000000000000000
17111711771117771117111711171717777111711171717717771771777717710000000000000000000000007677777600000000000000000000000000000000
17171717171717777177177717771717777177717771717171717171777771710000000000000000000000007677777600000000000000000000000000000000
17111717171117777177117717771117777111717771117171717171771177110000000000000000000000006666666600000000000000000000000000000000
17171717171717777177177717771717777771717771717171717171777771710000000000000000000000007777677700000000000000000000000000000000
17171711771717777177111711171717777111711171717717771771117717710000000000000000000000007777677700000000000000000000000000000000
11111111111111111111111111111111111111111111111111111111111111110000000000000000000000006666666600000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0
f0f0f0f0f0f0f0f0f0f0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0
f0f0f0f0f0f0f0f0f0f0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0
f0f0f0f0f0f0f0f0f0f0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0
f0f0f0f0f0f0f0f0f0f0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0
f0f0f0f0f0f0f0f0f0f0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0
f0f0f0f0f0f0f0f0f0f0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0
f0f0f0f0f0f0f0f0f0f0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001000500010000000000000000000000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
04040404040404040404040404040404040404040404040404040404040404040404040404040404040404040f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04042021222324252627040404040404040404040404040404040404040404040404040404040404040404040f0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04040404040404040404040404040404040404040404040404040404040404040404040404040404040404040f0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
090404040404040a0404040404040404040404040404040404040404040404040404040404040404040404040f0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05050505050505050804040404040404040404040404040404040404040404040404040404040404040404040f0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d0704040404040404040404040404040404040404040404040404040404040404040404040f0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d0704040404040404040404040404040404040404040404040404040404040404040404040f0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d0704040404040404040404040404040404040404040404040404040404040404040404040f0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d0704040404040404040705050505050505050704040404040404040404040404040404040f0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d070404040404040404070d0d0d0d0d0d0d0d0704040404040404040404040404040404040f0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d070404040404040404070d0d0d0d0d0d0d0d0704040404040404040404040404040404040f0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d070404040404040404070d0d0d0d0d0d0d0d0704040404040404040404040404040404040f0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d050505050505050505050d0d0d0d0d0d0d0d0704040404040404040404040404040404040f0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0704040404040404040404040404040404040f0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0704040404040404040404040404040404040f0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0704040404040404040404070505050505050f0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04040404040404040404040404040d0d0d0d0d0d0d0d0d0d0d0d0704040404040404040404070d0d0d0d0d0d0f0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04040404040404040404040404040d0d0d0d0d0d0d0d0d0d0d0d0704040404040404040404070d0d0d0d0d0d0f0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04040404040404040404040404040d0d0d0d0d0d0d0d0d0d0d0d0704040404040404040404070d0d0d0d0d0d0f0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04040404040404040404040404040d0d0d0d0d0d0d0d0d0d0d0d0704040404040404040404070d0d0d0d0d0d0f0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04040404040404040404040404040d0d0d0d0d0d0d0d0d0d0d0d0704040404040404040404070d0d0d0d0d0d0f0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04040404040404040404040404040d0d0d0d0d0d0d0d0d0d0d0d0704040404040404040404070d0d0d0d0d0d0f0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04040404040404040404040404040d0d0d0d0d0d0d0d0d0d0d0d0505050505050505050505050d0d0d0d0d0d0f0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0d0d0d0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0d0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000e0e0e0e0f0f0f0e0e0e0e0e0e0e0e0e0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000000003050080500e05013050170501c050260502605022050200501d0501a05016050110500d05009050060500405003050010500005000000000000000000000000000000000000000000000000000
0001000000000060500c05011050180501b0501d0501e0501f050200502005020050200501f0501d0501b05018050140500d05007050010500000000000000000000000000000000000000000000000000000000