pico-8 cartridge // http://www.pico-8.com
version 37
__lua__
player = {
x=8,
y=112
}

maze = {
x=0,
y=0
}

timer=2
lvls=8

function _init()
end

function _update()
--timer reset
if (time()%timer==0) then
	maze.x+=16
	player.x=8
	player.y=112
end
--levels reset
if (maze.x%(16*lvls)==0)then
	maze.x=0
end
--player movement
if (btn(⬆️)) then
	player.y-=8
	elseif (btn(⬇️))then
		player.y+=8
	elseif (btn(➡️))then
		player.x+=8
	elseif (btn(⬅️))then
		player.x-=8
end

end

function _draw()
cls()
map(maze.x,maze.y,0,0,16,16)
spr(16,player.x,player.y)
spr(17,112,8)
end
__gfx__
00000000777777770077770070077007700770070007000770700707700707077707707700000000000000000000000000000000000000000000000000000000
00000000700000070700007000000000070000700070007070700707700000007000000700000000000000000000000000000000000000000000000000000000
00700700707777077007700700077000007007000700070070700707007000700070770000000000000000000000000000000000000000000000000000000000
00077000707007077070070770700707700770077000700070700707070070077070000700000000000000000000000000000000000000000000000000000000
00077000707007077070070770700707700770070007000770700707700000707000070700000000000000000000000000000000000000000000000000000000
00700700707777077007700700077000007007000070007070700707007000000077070000000000000000000000000000000000000000000000000000000000
00000000700000070700007000000000070000700700070070700707000070707000000700000000000000000000000000000000000000000000000000000000
00000000777777770077770070077007700770077000700070700707707070077707707700000000000000000000000000000000000000000000000000000000
0000cccc888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000c800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00cc000c800088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00cc000c800088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c000cc00008800080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c000cc00008800080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccc0000000088880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001010101010101010000000000000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010101010101010101010101010102020202020202020202020202020202030303030303030303030303030303030404040404040404040404040404040405050505050505050505050505050505060606060606060606060606060606060707070707070707070707070707070708080808080808080808080808080808
0100010000000000000001000000000102000000000000000000020200000002030000000303000000000000000000030400000000000000000000000400000405000000050505050005050005000005060000000006000006060000060000060700000000000000000000000000000708000008000800080000000000080008
0100010000010101000101000000000102000002000000020002020000000202030003030000000003030300030300030400000404040400000000000400000405000505000000000000000000000005060606060006000000000606060006060707070000070707070707070707070708000008000800080000000000080008
0100010000010000000000010100000102000202000002020002000002020202030300000000030003000303000303030400040000000004040400000400000405000000000000050505050505050505060000060006000006000000060006060700000000000000000000000000000708080008000800080000080000080008
0100010000010101010100000000000102020200000000000000000002000002030300000000030003000003030300030400000000000000040400000400000405050500000000000000000000000005060606060006000006000000000006060707070707000007070700000707070708080008000800080000080000080008
0100000000000000000001010101010102000000020200000002000202000002030303000003030003000003030000030404000000000004000400000400000405000000050505050500050500000005060000000000000606060600060606060700000000000000000000000000000708080008000800000000080000000008
0100000000010000000000000100000102000002000000000200000000000202030003000003000003030303030303030400040000000400000004000000000405050000000005000505000005050505060600000000000006000000000600060700000007070707000007070707070708080008000800000000080000000008
0101010101010101010101000000010102020200000002000000000000020202030003030003030000000000030003030400000400000404000000040000000405050000000005000000000505050005060600060606060606000006060606060700000000000000000000000000000708080000000000080000080000080008
0101000000000001010000000101010102020000000002000002000002020002030000030000030000000000030000030404000404000000040000040400000405000005050005000000000000000005060600000000060006060006000606060707070707070000070707070700000708080000000800080000080000080008
0101000001000001000000000100000102000000000200000202000000000002030000030000030300000003030000030400000000040000000400040000000405000505050000000505000000000005060606060000060006060606000006060700000000000000000000000000000708080000000800000000000000080008
0100000001000000010101000000000102000000020200000200000000000002030000030000000303030303000000030400000004000000040004000004040405000500050000050505050005050505060006060000000000060600000006060700000000000000000000000000000708080000000000000000000000080008
0100010000000100010000010001010102020200000000000000020000000202030003030000000000000000000000030400000400000000000000040000040405050000050500050000050000000005060000060000060600000000000606060707070000070707070000070707070708000008000000080000080000080008
0100010001010100000100010001010102020000000002000002020000020002030003030000000303000000030300030400040000000004000000000400000405000505050505050505050500000005060606000000060600000606060600060700000000000000000000000000000708000008000800080000080000080008
0101010001000000010100000000000102000000000202000002000002020002030000030303030003030303030300030404000000000400040004000004000405000000000000050500000000000005060000000000000000000000060000060707070707070000070707070700000708000008000800080000080000080008
0100000000000100000000000101000102000000020000000000000002000002030000000000000000000000000000030400000000040000000400000004040405000000000000000000000000000005060000000606060000000600000006060700000000000000000000000000000708000008000800080000080000080008
0101010101010101010101010101010102020202020202020202020202020202030303030303030303030303030303030404040404040404040404040404040405050505050505050505050505050505060606060606060606060606060606060707070707070707070707070707070708080808080808080808080808080808
