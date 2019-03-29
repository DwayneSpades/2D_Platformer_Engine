require 'misc/misc'
require 'collectables/coins'
require 'misc/talk'
require 'player/player'
require 'player/debug'
require 'flags/cutscenes'
require 'misc/bullet'
--playing state/platformer screen
current_level=1
function load_level()
  levels={}
  table.insert(levels,map_1)
  table.insert(levels,map_2)
  table.insert(levels,map_3)
  table.insert(levels,map_4)
  --recursiveEnumerateMaps('maps',levels)
end

function start_playstate()
  --load_level()
  mousex=0
  mousey=0
    selectedX = ((math.floor((love.mouse.getX() / 16)+(camera.x/16)))+1)
    selectedY = ((math.floor((love.mouse.getY() / 16)+(camera.y/16)))+1)
    selectedCX = ((math.floor((love.mouse.getX() / 64)+(camera.x/64)))+1)
    selectedCY = ((math.floor((love.mouse.getY() / 64)+(camera.y/64)))+1)
  cellsize=64
  coins={}
  plat={}
  doors={}
  coins={}
  diag={}
  win=false
  debugger=false
  load_enemy()
  load_coins()
  screen_origin()
  load_controllers()
  load_player()
  load_hud()
  load_debug()
  load_cutscenes()
  
  sentence=1
  create_collision(current_map,0,0)
  cutscene=false
  diag_fin=false
end

function update_playstate(dt)
  
  
  control_toggle()
    
   
  if debugger==true then
  update_debug()
  elseif debugger==false then
  update_player()
end

  
  if (p.sl==false or p.h==85) and debugger==false  then
    camera:follow(p.x,p.y)
    tmp_pp=p.y
  elseif p.sl and debugger==false then
    camera:follow(p.x,p.y-35)
  elseif debug then
    camera:follow(debug.x,debug.y)
  end
  selectedX = ((math.floor((love.mouse.getX() / 16)+(camera.x/16)))+1)
    selectedY = ((math.floor((love.mouse.getY() / 16)+(camera.y/16)))+1)
    selectedCX = ((math.floor((love.mouse.getX() / 64)+(camera.x/64)))+1)
    selectedCY = ((math.floor((love.mouse.getY() / 64)+(camera.y/64)))+1)
     cutscene_handler()
  update_text()
  place_coins()
  update_coins()
  update_hud()
  update_enemy()
  --update_bullet()
   
    

  
  if d and debugger==false then 
    debugger=true
  elseif d and debugger==true then
    debugger=false
  end
  
  
  d=false
  
  --put into its own function to handle doors in different rooms
  door_to(1,393*16,10*16,0)
  door_to(2,993*16,218*16,0)
  door_to(3,1481*16,233*16,2)
  door_to(4,9*16,49*16,1)
  door_to(5,9*16,49*16,1)
if map_collision(p.x,p.y,p.w,p.h,1165*16,237*16,cellsize*3,cellsize) then
  win=true
end  

end

function draw_playstate()
  camera:create_cam()
  scale_screen()
  camera:set_cam(0,0)
  draw_map(current_map,0,0)
  draw_in_world()
  draw_coins()
  draw_hud()
  draw_enemy()
  draw_player()
  draw_bullet()
  draw_debug()
  draw_diag()
  love.graphics.setColor(1,1,1,0.8)
  love.graphics.rectangle('fill',(selectedX*16)-16,(selectedY*16)-16,16,16)
    love.graphics.setColor(1,0,0,0.5)
  love.graphics.rectangle('fill',(selectedCX*cellsize)-cellsize,(selectedCY*cellsize)-cellsize,cellsize,cellsize)
  
  camera:pop()
end
