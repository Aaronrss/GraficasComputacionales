pico-8 cartridge // http://www.pico-8.com
version 37
__lua__
cx=64
cy=64

px=32
py=32


function _draw()
	cls()
	circ(cx,cy,1,7)
	circ(px,py,1,8)
	
	dx=cx-px
	dy=cy-py
	
	line(cx,cy,px,py,7)
	line(cx,cy,px,py,7)
	
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
