require 'misc/collision'
local steps_x=1
local steps_y=1
local dropped=false
local tmp_x=0
local tmp_w=0
--[[if p.w>cellsize then
        p.x=(math.floor(((p.x-(offset))/cellsize))*cellsize)+p.w
      else
        p.x=(math.floor(((p.x-(offset))/cellsize))*cellsize)+cellsize
      end
      
      if p.w>cellsize then
        p.x=(math.floor(((p.x+(offset))/cellsize))*cellsize)-(p.w-cellsize)
      else
        p.x=(math.floor(((p.x+(offset))/cellsize))*cellsize)+(cellsize-p.w)
      end
      ]]

function player_collision_x()
  old_x=p.x
  --movement update speed
  
    p.s=p.s-0.5
  
 if p.s<=0 then
  p.s=0
 end
 
  local step_speed=p.s/steps_x
  
  for i=1,steps_x do
   p.x=p.x+step_speed*p.dx
  
  for k,v in pairs(cols) do
  --if (v.x>p.x-cellsize*3 and v.x<p.x+cellsize*3) then
 	if(map_collision(p.x,p.y,p.w,p.h,v.x,v.y,cellsize,cellsize)) then
 		 if v.tile==1 or v.tile==4 or (v.tile==2 and p.x>v.x+cellsize/2) or (v.tile==3 and p.x<v.x) then
 		 p.cx = true 
     col_plat=true end
      tmp_x=v.x
      tmp_w=v.w
 		 break 
  else
     p.cx =false
 	  max_grav=def_grav
 	 end
 	--end
 end

end
 if p.cx then
    
    tmp_dx=p.dx
    local offset=p.w/2
    if p.dx<0 then
     
      p.dx=0
      if p.w>cellsize then
        p.x=tmp_x+tmp_w
      else
        p.x=tmp_x+tmp_w
      end
 		 elseif p.dx>0 then
 		  
      p.dx=0
      if p.w>cellsize then
        p.x=tmp_x-p.w
      else
        p.x=tmp_x-p.w
      end
      
       
 		 end

  p.dx=tmp_dx
  if down and p.og==false then
   max_grav=25
  else
  max_grav=2
  end
 -- if p.sl==false then
   -- p.pct=0
  --end
  p.wj=true
end
end

function player_collision_y()
  
  local step_speed=p.v/steps_y
  
  old_y=p.y
  for i=1,steps_y do
   p.y=p.y+step_speed
  
 --if (btn(⬇️) and button~=1) then
 
 
 for k,v in pairs(cols)  do
  
  --if (v.y>p.y-cellsize*3 and v.y<p.y+cellsize*3) then
 	if(map_collision(p.x,p.y,p.w,p.h,v.x,v.y,cellsize,cellsize)) then
 		 local offset=(p.h/125)
 		  if v.tile==4 and (p.y<v.y) then
 		   p.v=-24
       p.cx=false
 		  end
 		  if v.tile==1 or v.tile==9 then
 		  p.cy=true
      
 		  if(p.y>v.y) then
        
 		  if p.v<0 then 
 		  p.og=false
     p.v=0
      if p.sl==false then
       p.y=v.y+cellsize+18
      elseif p.sl then
        p.y=v.y+cellsize+18
      end
    else
      top_collision=false
     end
     end
 		  
 		  if(p.y<v.y)  then
        --print('landed')
 		  if p.v>=0 then
        
      
    
      p.v=0
      if p.h>cellsize then
        p.y=v.y-p.h
      else
        p.y=v.y-p.h
      end
      
      end
 		  	p.og=true
 		  	dropped=false
 	  	end
 	  	end
 	  	
 	  break
 	  
 	  else
 	  p.cy =false
    
    p.og=false
 	 end
 end
 
 end
--end
end

function grave()
  
  
  
  if p.pct<=0 then
    p.sl=false
   end
if p.sl then
  p.h=50
  
  if crouched==false then
    p.y=p.y+(tmp_h-p.h)
    crouched=true
  end
elseif p.sl==false then
  if crouched==true then
    p.y=p.y-(tmp_h-p.h)
    crouched=false
  end
  p.h=tmp_h
end
if p.sl and p.v<0 then
  p.sl=false
  p.y=p.y-10
  p.h=tmp_h
end
  if ((down or (down and left) or (down and right)) and p.og and p.pct<=0 and p.sl==false) then
    p.s=16
    p.sl=true
    p.pct=20
  end
  if p.sl==true then
    p.jh=bos_jump
  else
    p.jh=def_jump
  end
  
  if x and p.og  then
    p.v=-p.jh
    p.og=false
  elseif x and p.wj and p.cy==false then
      tmp_dx=(tmp_dx)*(-1)
      p.dx=tmp_dx
      --print(tmp_dx)
      p.s=20
      p.v=-p.jh
      p.og=false
      p.pct=20
      p.wj=false
  end
  
  if rx==true and p.og==false  and p.v<0 then
    p.v=p.v/2
    dropped=true
  end
   x=false
   rx=false
  p.pct=p.pct-1
  
  if p.pct<=0 then
    p.pct=0
    p.wj=false
   -- p.sl=false
    p.sld=false
   end
   
 --Implements gravity   
  p.v=p.v+gravity
  
  if p.v>=max_grav then
   p.v=max_grav
 
  end
end


function slope_collision()
  --left facing slopes
  for k,v in ipairs(cols)do
    if v.tile==2 then
      if map_collision(p.x,p.y,p.w,p.h,v.x,v.y,cellsize,cellsize) and p.v>=0 then
  
        if p.x+p.w>=v.x+cellsize  then
          p.y=v.y-p.h
          slant=true
          p.og=true
        else
          p.y=((v.y-(p.h-18))-(((p.x)-(v.x))))
           slant=true
          p.og=true
          dropped=false
       
        end
      --print('left facing')
    else
  slant=false
end
end
--right facing slope
  if v.tile==3 then
    if map_collision(p.x,p.y,p.w,p.h,v.x,v.y,cellsize,cellsize) and p.v>=0 then
      if p.x<=v.x  then
        p.y=v.y-p.h
        slant=true
        p.og=true
      elseif p.h>cellsize then
         p.y=((p.x-p.h+20)+(v.y-(v.x)))-22
         p.og=true
      else
        p.y=((p.x-cellsize)+(v.y-(v.x)))+((v.w/2)-22)
        slant=true
        p.og=true
        dropped=false
      end 
      --print('right facing')
    else
      slant=false
      end
    end
  end
end

iframes=false
local invinsibility_time=50
local ilimit=invinsibility_time
function player_worldhit_collision()
  
  
  if iframes==true then
    ilimit=ilimit-1
    
    print(ilimit)
  end
  
  if ilimit<=0 and iframes==true then
    ilimit=invinsibility_time
    
    iframes=false
  end
  
  for i,v in ipairs(cols) do
    if v.tile==9 then
      if map_collision(p.x,p.y,p.w+5,p.h+5,v.x,v.y,cellsize,cellsize) and iframes==false then
        p.health=p.health-30
        iframes=true
        --print('respawned')
      end
    end
  end
end