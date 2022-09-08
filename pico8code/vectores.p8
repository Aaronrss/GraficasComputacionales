pico-8 cartridge // http://www.pico-8.com
version 37
__lua__
function make_vector(x,y)
 return
 {
  x=x,
  y=y
 }
end

function v_add(a,b)
 return {x=a.x+b.x,y=a.y+b.y}
end

function v_sub(a,b)
 return {x=a.x-b.x,y=a.y-b.y}
end

function v_scale(a,s)
 return {x=a.x*s,y=a.y*s}
end

function v_mag(a)
 return sqrt(a.x*a.x+a.y*a.y)
end

function v_normalize(a)
	local m=v_mag(a)
 return {x=a.x/m,y=a.y/m}
end


cv=make_vector(0,0)
pv=make_vector(-32,-32)

bullets={}

function make_bullet(x,y,vx,vy)
 return {x=x,y=y,vx=vx,vy=vy}
end

function _update60()
-- pv.x=40*cos(t()/12)
-- pv.y=40*sin(t()/12)

 if(btn(0))pv.x-=1
 if(btn(1))pv.x+=1
 if(btn(2))pv.y-=1
 if(btn(3))pv.y+=1

 if(btn(0,1))cv.x-=1
 if(btn(1,1))cv.x+=1
 if(btn(2,1))cv.y-=1
 if(btn(3,1))cv.y+=1
 
 hv=v_sub(pv,cv)
 uv=v_normalize(hv)

 if btn(4) or btn(5) then
  add(bullets,
  make_bullet(cv.x,cv.y,
  uv.x*4,uv.y*4))
 end
 
 for i=1,#bullets do
 	local b=bullets[i]
 	b.x+=b.vx
 	b.y+=b.vy
 end
 
end


function _draw()
 cls()
 camera(-64,-64)
 
	circfill(cv.x,cv.y,2,8)
	circ(pv.x,pv.y,2,12)
	
	line(cv.x,cv.y,pv.x,cv.y,8)
	line(cv.x,cv.y,cv.x,pv.y,11)

	--line(cv.x,cv.y,pv.x,pv.y,10)


--	hv=v_add(cv,v_scale(v_sub(pv,cv),.5))

 hx=cv.x+uv.x*20
 hy=cv.y+uv.y*20
	
	line(cv.x,cv.y,hx,hy,10)

 for i=1,#bullets do
 	local b=bullets[i]
 	circ(b.x,b.y,1,8)
	end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
