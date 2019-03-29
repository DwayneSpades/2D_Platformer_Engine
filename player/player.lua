require 'player/controller'
require 'player/player_collision'
require 'player/player_sprites'
--global gravity(temporary)
gravity=1
def_grav=15
def_jump=18
bos_jump=30
max_grav=0
def_speed=8
function load_player()
  p={
    x=96,
    y=64,
    w=46,
    h=85,
    s=def_speed,
    v=1,
    jh=0,
    dx=1,
    health=100,
    og=false,
    wlk=false,
    wj=false,
    cx=false,
    cy=false,
    sl=false,
    pct=0,
    death=false
  }
  tmp_dx=0
  tmp_h=p.h
  top_collision=false
  crouched=false
  slant=false
  dash=14
  on_plat=false
  col_plat=false
  --jh stands for jumpheight
  --og stands for on ground
  --wlk stands for walking
  --wj stands for wall_jump
  --cx stands for x collision
  --cy stands for y collsion
  --sl stands for slide dash
  --pct stands for parkour time 
  --(for speed boosted actions on the enviroment)
end
function player_reset(x,y)
  p.x=x
  p.y=y
  p.health=100
  p.s=0
  p.dx=0
end
function update_player()
--X SIDE--
--left and right controls
  if p.health<=0 then
    --player_reset(300,300)
    
    state=0
    --start_game()
  end
  if (left) and (p.wj==false) and (p.pct==0) then
    p.dx=-1
    tmp_dx=p.dx
    p.s=def_speed
    print("left")
  end
  
  if (right) and (p.wj==false) and (p.pct==0) then
    p.dx=1
    tmp_dx=p.dx
    p.s=def_speed
     print("right")
  end
--X SIDE--

player_collision_x()
player_collision_y()
xplat(128,16)
--Y SIDE--
slope_collision()
if cutscene then
grave()
p.v=max_grav
else
grave()

end

player_worldhit_collision()
end

p_sprites()
function draw_player()
    love.graphics.line(21*cellsize,9*cellsize,30*cellsize,0*cellsize)
    if iframes then
      love.graphics.setColor(1,0.5,0.2,1)
      love.graphics.rectangle('fill',p.x,p.y,p.w,p.h)
     -- love.graphics.draw(p_sprites,p_spr[0],p.x-30,p.y-46,0,3.2,3.2)
    elseif iframes==false then
      love.graphics.setColor(1,1,1,1)
      love.graphics.rectangle('fill',p.x,p.y,p.w,p.h)
      --love.graphics.draw(p_sprites,p_spr[0],p.x-9,p.y-43)
    end
end
