bullet_set={}
bullets={}
paint={}
btime=25
blimit=6
bullets_in=100
angle=0
function update_bullet()
  anglestep=360/bullets_in
 -- 
  tmp_posx=p.x+p.w/2
  tmp_posy=p.y+p.h/2
  posx=0
  posy=0
 
 if btime>=blimit then
     for n=1,bullets_in do
        posx=tmp_posx+math.sin((angle*math.pi)/180)*10
        posy=tmp_posy+math.cos((angle*math.pi)/180)*10
        
        table.insert(bullets,make_bullet(posx,posy,5,tmp_posx,tmp_posy))
        angle=angle+anglestep
    end
      
      
    btime=0
  end
  
  btime=btime+1
  
  for i,v in ipairs(bullets) do
    

    local dir = math.atan2(( v.y - v.starty ), ( v.x - v.startx ))
    local dx, dy = v.s * math.cos(dir), v.s * math.sin(dir) 
     v.dy=(normalize(v.x,0,v.x-v.startx))*v.s
     v.dx=(normalize(v.y,0,v.y-v.starty))*v.s
    
    v.x=v.x+dx
    v.y=v.y+dy
    v.life=v.life-1
    if v.life<=0 then
      table.remove(bullets,i)
    end
    
    for a,l in ipairs(cols) do
    
        if sphere_rec_collision(v.x,v.y,v.r,l.x,l.y,cellsize,cellsize) then
          table.remove(bullets,i)
          table.insert(paint,make_paint(v.x,v.y,v.r))
        end
      
    end
   
end

  for i,v in ipairs(paint) do
    v.life=v.life-1
    if v.life<=0 then
      table.remove(paint,i)
    end
  end
  
end
function draw_bullet()
   --[[ for i,v in ipairs(bullets) do
  
      love.graphics.setColor(1,0.6,0.2,1)
      love.graphics.circle('fill',v.x,v.y,v.r)
  end
  for i,v in ipairs(paint) do
  
      love.graphics.setColor(0.6,0.45,1,1/v.life)
      love.graphics.circle('fill',v.x,v.y,v.r)
  end
  ]]
end

function make_bullet(px,py,pr,psx,psy)
  b={
    x=px,
    y=py,
    startx=psx,
    starty=psy,
    dx=0,
    dy=0,
    xvec=0,
    yvec=0,
    r=pr,
    a=pa,
    s=20,
    life=20
    }
  return b
end

function make_paint(px,py,pr)
  b={
    x=px,
    y=py,
    startx=psx,
    starty=psy,
    dx=0,
    dy=0,
    xvec=0,
    yvec=0,
    r=pr,
    a=pa,
    s=0,
    life=20
    }
  return b
end

function normalize(value,min,max)
    return (value -min) /(max-min)
end
