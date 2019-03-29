require 'misc/collision'
require 'player/controller'
require 'player/player_collision'
require 'player/player_sprites'
--playing state/platformer screen

local menu={}
function start_titlescreen()
  screen_origin()
  load_controllers()
   m={
    x=0,
    y=0,
    w=300,
    h=64,
    t=button
  }
  cursor_position=1
  table.insert(menu,create_menu(1*m.w,1*m.h,"Start Game"))
  table.insert(menu,create_menu(1*m.w,2*m.h,"Options"))
  moused=false
end

function update_titlescreen()
  controller_input()
  if right_click then
    right_click=false
  end
  if tap_up and cursor_position>1  then
    cursor_position=cursor_position-1
   
  end
  if tap_down and cursor_position<2  then
    cursor_position=cursor_position+1
    
  end
  --falsify taps
  if(cursor_position==1 and x) then
    --update_player()
      print('the long awaited patch is here!!!')
      
      x=false
    --deletes lists
     -- menu={}
      current_map=levels[1]
      cursor_position=0
      state=1
      start_game()
  end
   if(cursor_position==2 and x) then
    --update_player()
      print('the long awaited patch is here!!!')
      
      x=false
    --deletes lists
     -- menu={}
      current_map=levels[1]
      cursor_position=0
      state=2
      start_pause()
  end
  --yeah :P
  for i,v in ipairs(menu) do
    --moused=mouse_over(v)
    if mouse_over(v) then
    if (left_click and v.t=="Start Game") then
      --update_player()
      print('the long awaited patch is here!!!')
      left_click=false
    --deletes lists
     -- menu={}
      current_map=levels[1]
      cursor_position=1
      state=1
      start_game()
    end
    if (left_click and v.t=="Options") then
      --update_player()
      print('the long awaited patch is here!!!')
      left_click=false
    --deletes lists
     -- menu={}
      cursor_position=1
      state=2
      start_pause()
    end
   end
  end
  x=false
  tap_up=false
  tap_down=false
  --print(moused)
end

function draw_titlescreen()
  camera:create_cam()
  scale_screen()
  camera:set_cam(0,0)
  love.graphics.setColor(1,1,1,1)
  love.graphics.rectangle('fill',250,m.h*cursor_position+(m.h/3),16,16)
  if menu ==nil then
  else
  for i,v in ipairs(menu) do
    
    love.graphics.setColor(1,0,1)
    love.graphics.rectangle('line',v.x,v.y,v.w,v.h)
    love.graphics.print(v.t,v.x+(v.w/2),v.y+(v.h/2))
    if mouse_over(v) then
      cursor_position=i
    end
    if cursor_position==i   then
      love.graphics.setColor(0,0,0.5,0.4)
      love.graphics.rectangle('fill',v.x,v.y,v.w,v.h)
      love.graphics.setColor(0,0,0)
      --love.graphics.print(cursor_position,v.x+(v.w/2),v.y+(v.h/2))
    end
  end
  end
  camera:pop()
end

function create_menu(x,y,button)
  m={
    x=x,
    y=y,
    w=300,
    h=64,
    t=button
  }
  return m
end