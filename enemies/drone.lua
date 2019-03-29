local steps_x=5
local steps_y=5
local dropped=false
local tmp_x=0
local tmp_w=0


function load_enemy()
  enemies={}
  --[[table.insert(enemies, create_enemy())
  table.insert(enemies, create_enemy2())
  ]]
end

function update_enemy()
  for i,e in ipairs(enemies) do
    if e.x>p.x-3000 and e.x<p.x+3000 then
    e.oldx=e.x
    
    
    local tmp_dx=e.dx
    e.x=e.x+(e.speed*e.dx)
    for i,v in ipairs(cols) do
        ----X COLLISION
        if map_collision(e.x,e.y,e.w,e.h,v.x,v.y,v.w,v.h) then
          if v.tile==1 then
         
          e.col_x=true
          if e.dx<0 then
            e.dx=0
            e.x=v.x+v.w
          end
          if e.dx>0 then
            e.dx=0
            e.x=v.x-e.w
          end
           e.dx=tmp_dx*(-1)
          print('INTERSECTION')
          end
          break
        else
          e.col_x=false
        end
        
       
      end
      e.oldy=e.y
      
       if e.og then
        e.velocity=-24
    end
      
      e.y=e.y+e.velocity
      e.velocity=e.velocity+e.gravity
  
      if e.velocity>=e.max_grav then
      e.velocity=e.max_grav
      end
        ----Y COLLISION
      for i,v in ipairs(cols) do
        if map_collision(e.x,e.y,e.w,e.h,v.x,v.y,v.w,v.h) then
          e.col_y=true
          e.velocity=0
          if v.tile==1 or v.tile==9 then
           if e.y>v.y then
            
            e.y=v.y+v.h+4
          end
          if e.y<v.y then
            e.og=true
            e.y=v.y-e.h
          end
          end
          break
        else
          e.col_y=false
          e.og=false
        end
      end
     
    enemy_slope_collision(e)
  end
  end
end

function draw_enemy()
  for i,e in ipairs(enemies) do
    if e.x>p.x-5000 and e.x<p.x+5000 then
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle('fill',e.x,e.y,e.w,e.h)    
    end
   end
end

function enemy_slope_collision(o)
  --left facing slopes
  for k,v in ipairs(cols)do
    if v.tile==2 then
      if map_collision(o.x,o.y,o.w,o.h,v.x,v.y,cellsize,cellsize)  then
        if o.x+o.w>=v.x+cellsize  then
          o.y=v.y-o.h
          
        else
          o.y=((v.y-cellsize)-(((o.x)-(v.x))))-8
          
        end
      --print('left facing')
    else
 -- slant=false
end
end
--right facing slope
  if v.tile==3 then
    if map_collision(o.x,o.y,o.w,o.h,v.x,v.y,cellsize,cellsize)  then
      if o.x<=v.x  then
        o.y=v.y-o.h
       -- slant=true
       -- o.og=true
      else
        o.y=((o.x-cellsize)+(v.y-(v.x)))-22
        --slant=true
        --o.og=true
      --  dropped=false
      end 
      --print('right facing')
    else
      --slant=false
      end
    end
  end
end

function create_enemy(ex,ey,edx)
  e_stats={ 
  x=ex,
  y=ey,
  w=46,
  h=85,
  speed=6,
  dx=edx,
  oldx=0,
  oldy=0,
  velocity=0,
  gravity=1,
  max_grav=15,
  jumpheight=-400,
  og=false,
  col_x=false,
  col_y=false
  --sprite=love.graphics.newImage('enemy.png')
  } 
 return e_stats
end
function create_enemy2(ex,ey,edx)
  e_stats={ 
  x=ex,
  y=ey,
  w=46,
  h=85,
  speed=25,
  dx=edx,
  oldx=0,
  oldy=0,
  velocity=0,
  gravity=1,
  max_grav=15,
  jumpheight=-120,
  og=false,
  col_x=false,
  col_y=false
  --sprite=love.graphics.newImage('enemy.png')
  } 
 return e_stats
end