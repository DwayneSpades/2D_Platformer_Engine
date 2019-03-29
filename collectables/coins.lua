require 'enemies/drone'
--This is a nice framework for placing objects in the level and remebering placement.
--these items could be coins, enemies, switches, etc...
item=1
plat={}
doors={}
e_spawns={}
function place_coins()
  
  if left_click then
    if item==1 then
    table.insert(coins,coin((selectedX*16)-16,(selectedY*16)-16))
  elseif item==2 then
    table.insert(plat,make_plat((selectedX*16)-16,(selectedY*16)-16,128,16))
   elseif item==3 then
    table.insert(doors,make_door((selectedX*16)-16,(selectedY*16)-16,cellsize,cellsize*2))
  elseif item==4 then
    table.insert(e_spawns,make_spawn((selectedX*16)-16,(selectedY*16)-16))
  end
  
    left_click=false
  end
  
  if c and item>1 then 
    
    item=item-1
  end
  
  if v and item<4 then
    item=item+1
  end
  c=false
  v=false
  if right_click then
      table.save(coins,'flags/map_coins_'..current_level..'.lua')
      table.save(plat,'flags/map_plats_'..current_level..'.lua')
      table.save(doors,'flags/map_doors_'..current_level..'.lua')
      table.save(e_spawns,'flags/map_spawns_'..current_level..'.lua')
      --load_coins()
    right_click=false
  end
  
end

function load_coins()
  
  for i,v in ipairs(levels) do
    coins=table.load('flags/map_coins_'..current_level..'.lua')
    plat=table.load('flags/map_plats_'..current_level..'.lua')
    --doors=table.load('flags/map_doors_'..current_level..'.lua')
    e_spawns=table.load('flags/map_spawns_'..current_level..'.lua')
  end
   for i,v in ipairs(e_spawns) do 
     table.insert(enemies, create_enemy(v.x,v.y,-1))
  end
  
end
function update_coins()
 
  for i,v in ipairs(coins) do
  if sphere_rec_collision(v.x,v.y,v.r,p.x,p.y,p.w,p.h) then
    coins_collected=coins_collected+1
    table.remove(coins,i)
  end
  
end

end
function draw_coins()
  
  for i,v in ipairs(doors) do
    love.graphics.setColor(1,1,0)
    love.graphics.rectangle('fill',v.x,v.y,v.w,v.h)
    love.graphics.setColor(1,0,0)
    love.graphics.print(i,v.x+10,v.y+10,0,5,5)
  end
  
  for i,v in ipairs(coins) do
    love.graphics.setColor(1,1,0)
    love.graphics.circle('fill',v.x,v.y,v.r)
  end
  
  for i,v in ipairs(plat) do
    love.graphics.setColor(1,1,0)
    love.graphics.rectangle('fill',v.x,v.y,v.w,v.h)
     
  end
  
  for i,v in ipairs(e_spawns) do
    love.graphics.setColor(1,0,0)
    love.graphics.circle('line',v.x,v.y,v.r)
  end
  
end
function coin(px,py)
  co={
    x=px,
    y=py,
    r=16,
  }
  return co
end

function make_spawn(px,py)
  spa={
    x=px,
    y=py,
    r=16,
  }
  return spa
end

function make_door(px,py,pw,ph,ps)
  po={
    x=px,
    y=py,
    w=pw,
    h=ph,
    s=5,
    t=200,
    dx=1
  }
  return po
end

function make_plat(px,py,pw,ph,ps)
  po={
    x=px,
    y=py,
    w=pw,
    h=ph,
    s=5,
    t=200,
    dx=1
  }
  return po
end

function door_to(door,x,y,room)
  for i,v in ipairs(doors) do
    if i==door then
      if _collision(p,v) then
        if room==0 then
          p.x=x
          p.y=y
        elseif room>=1 then
          current_map=levels[room]
          current_level=room
          start_game()
          p.x=x
          p.y=y
      end
    end
  end
end
end
function xplat(cellsizex,cellsizey)
  for k,v in pairs(plat)  do
    
   if v.t<=0 then
      v.dx=v.dx*(-1)
      v.t=200
    end
  
 	if(map_collision(p.x,p.y,p.w,p.h,v.x,v.y,cellsizex,cellsizey)) then
 		 local offset=(p.h/125)
 		  
 		 
 		  if(p.y+(p.h/1.5)<v.y)  then
        
          if p.cx==false then
            p.x=p.x+(v.s*v.dx)
          end
          
        --print('landed')
 		  if p.v>=0 then
        
     
        p.v=0
      if p.h>cellsizey then
        p.y=v.y-p.h
        
      else
        p.y=v.y-p.h
      end
    
    
      
      
    end
    dropped=false
 		  	p.og=true
 		  	
 	  	end
 	  	
 	  	
 	  
  else
  
 	   on_plat=false
 	 end
 
  v.t=v.t-1
    
    v.x=v.x+v.s*v.dx
end

end



  local function exportstring( s )
      return string.format("%q", s)
   end

   function table.save(  tbl,filename )
      local charS,charE = "   ","\n"
      local file,err = io.open( filename, "wb" )
      if err then return err end

      -- initiate variables for save procedure
      local tables,lookup = { tbl },{ [tbl] = 1 }
      file:write( "return {"..charE )

      for idx,t in ipairs( tables ) do
         file:write( "-- Table: {"..idx.."}"..charE )
         file:write( "{"..charE )
         local thandled = {}

         for i,v in ipairs( t ) do
            thandled[i] = true
            local stype = type( v )
            -- only handle value
            if stype == "table" then
               if not lookup[v] then
                  table.insert( tables, v )
                  lookup[v] = #tables
               end
               file:write( charS.."{"..lookup[v].."},"..charE )
            elseif stype == "string" then
               file:write(  charS..exportstring( v )..","..charE )
            elseif stype == "number" then
               file:write(  charS..tostring( v )..","..charE )
            end
         end

         for i,v in pairs( t ) do
            -- escape handled values
            if (not thandled[i]) then
            
               local str = ""
               local stype = type( i )
               -- handle index
               if stype == "table" then
                  if not lookup[i] then
                     table.insert( tables,i )
                     lookup[i] = #tables
                  end
                  str = charS.."[{"..lookup[i].."}]="
               elseif stype == "string" then
                  str = charS.."["..exportstring( i ).."]="
               elseif stype == "number" then
                  str = charS.."["..tostring( i ).."]="
               end
            
               if str ~= "" then
                  stype = type( v )
                  -- handle value
                  if stype == "table" then
                     if not lookup[v] then
                        table.insert( tables,v )
                        lookup[v] = #tables
                     end
                     file:write( str.."{"..lookup[v].."},"..charE )
                  elseif stype == "string" then
                     file:write( str..exportstring( v )..","..charE )
                  elseif stype == "number" then
                     file:write( str..tostring( v )..","..charE )
                  end
               end
            end
         end
         file:write( "},"..charE )
      end
      file:write( "}" )
      file:close()
   end
   
   --// The Load Function
   function table.load( sfile )
      local ftables,err = loadfile( sfile )
      if err then return _,err end
      local tables = ftables()
      for idx = 1,#tables do
         local tolinki = {}
         for i,v in pairs( tables[idx] ) do
            if type( v ) == "table" then
               tables[idx][i] = tables[v[1]]
            end
            if type( i ) == "table" and tables[i[1]] then
               table.insert( tolinki,{ i,tables[i[1]] } )
            end
         end
         -- link indices
         for _,v in ipairs( tolinki ) do
            tables[idx][v[2]],tables[idx][v[1]] =  tables[idx][v[1]],nil
         end
      end
      return tables[1]
   end
-- close do
