require 'misc/tilebatch'

--collision instantiation
function _collision(obj_1,obj_2)
	return 
       obj_1.x < obj_2.x+obj_2.w and
			 obj_1.y < obj_2.y+obj_2.h and
			 obj_2.x < obj_1.x+obj_1.w and
			 obj_2.y < obj_1.y+obj_1.h 
			 
end
function sphere_rec_collision(sphere1x,sphere1y,sphere1r,recx,recy,recw,rech)
  local DeltaX = sphere1x - math.max(recx, math.min(sphere1x, recx + recw))
  local DeltaY = sphere1y - math.max(recy, math.min(sphere1y, recy+ rech))
return (DeltaX * DeltaX + DeltaY * DeltaY) < (sphere1r * sphere1r) 
  
end
function rec_triang_collision(rec,x0,y0,x1,y1,x2,y2)
  local left=rec.x
  local right=rec.x+rec.w
  local top=rec.y
  local bottom=rec.y+rec.h
  m =(y1-y0)/(x1-x0)
  c= y0-(m*x0)
  if(m>0)then
    top_intersection =(m*left+c)
    bottom_intersection=(m*right +c)
  else
    top_intersection=(m*right +c)
    bottom_intersection=(m*left +c)
  end
end
function mouse_over(v)
 return love.mouse.getX() > v.x     and 
        love.mouse.getX() < v.x+v.w and
        love.mouse.getY() > v.y     and
        love.mouse.getY() < v.y+v.h
end
function map_collision(x1,y1,w1,h1,x2,y2,w2,h2)
	return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1 
			
end


local spawn_made=false

function create_collision(_map_,map_x,map_y)
 local new_cols={}
 x2_lim=0
 y2_lim=0
 for x, column in ipairs(_map_) do
  for y,row in ipairs(column) do
   	x2_lim=x
   	y2_lim=y
   	if _map_[x][y] == 1 then
   	table.insert(new_cols,{x=map_x+(x-1)*cellsize, y=map_y+(y-1)*cellsize,w=cellsize,h=cellsize,tile=1})
   	end
   	if _map_[x][y] == 2 then
      table.insert(new_cols,{x=map_x+(x-1)*cellsize, y=map_y+(y-1)*cellsize,w=cellsize,h=cellsize,tile=2})
   	end
   	if _map_[x][y] == 3 then
   	table.insert(new_cols,{x=map_x+(x-1)*cellsize, y=map_y+(y-1)*cellsize,w=cellsize,h=cellsize,tile=3})
   	end
   	if _map_[x][y] == 4 then
   	table.insert(new_cols,{x=map_x+(x-1)*cellsize, y=map_y+(y-1)*cellsize,w=cellsize,h=cellsize,tile=4})
    end
    if _map_[x][y] == 9 then
   	table.insert(new_cols,{x=map_x+(x-1)*cellsize, y=map_y+(y-1)*cellsize,w=cellsize,h=cellsize,tile=9})
   	end
   	if _map_[x][y] == 5 then
   	
   	pspawnx=map_x+(x-1)*cellsize
   	pspawny=map_y+(y-1)*cellsize
   	spawn_made=true
   	elseif spawn_made==false then
   	pspawnx=32
   	pspawny=96
   	end
  end
 end
  cols=new_cols
  x2_lim=x2_lim*cellsize
  y2_lim=y2_lim*cellsize
end

make_sprites()

function draw_map(map__,map_x,map_y)
if debugger then
  cellsize=64
end
local playerx=math.floor((p.x+(cellsize/2))/cellsize)+1
local playery=math.floor((p.y+(cellsize/2))/cellsize)+1
for x,row in ipairs(map__) do
  for y,column in ipairs(row) do
   if ((x>playerx-13 and x<playerx+13) and (y>playery-13 and y<playery+13)) or debugger then
   if map__[x][y]==1 then
     love.graphics.setColor(1,1,1)
    love.graphics.draw(tilesetImage,tileQuads[1],map_x+(cellsize*x)-cellsize,map_y+(cellsize*y)-cellsize,0,cellsize/32)
   end
   if map__[x][y]==2 then
     love.graphics.setColor(1,1,1)
    love.graphics.draw(tilesetImage,tileQuads[2],map_x+(cellsize*x)-cellsize,map_y+(cellsize*y)-cellsize,0,cellsize/32)
   end
   if map__[x][y]==3 then
     love.graphics.setColor(1,1,1)
    love.graphics.draw(tilesetImage,tileQuads[3],map_x+(cellsize*x)-cellsize,map_y+(cellsize*y)-cellsize,0,cellsize/32)
   end
   if map__[x][y]==4 then
    love.graphics.draw(tilesetImage,tileQuads[4],map_x+(cellsize*x)-cellsize,map_y+(cellsize*y)-cellsize,0,cellsize/32)
   end
   if map__[x][y]==5 then
    love.graphics.draw(tilesetImage,tileQuads[5],map_x+(cellsize*x)-cellsize,map_y+(cellsize*y)-cellsize,0,cellsize/32)
   end
   if map__[x][y]==9 then
     love.graphics.setColor(1,0,0)
    love.graphics.draw(tilesetImage,tileQuads[9],map_x+(cellsize*x)-cellsize,map_y+(cellsize*y)-cellsize,0,cellsize/32)
   end
   end
   --if (btnp(❎)) and bpos_x==y and bpos_y==x then
    --map__[x][y]=2
   --end
  end 
 end


end