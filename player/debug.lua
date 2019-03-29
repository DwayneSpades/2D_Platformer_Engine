require 'collectables/coins'
require 'player/controller'
require 'player/player_collision'
require 'player/player_sprites'

function load_debug()
  debug={x=0,y=0,w=32,h=32,s=25,}
end

function update_debug()
  
  if left then
    debug.x=debug.x-debug.s
  end
  if right then
    debug.x=debug.x+debug.s
  end
  if up then
    debug.y=debug.y-debug.s
  end
  if down then
    debug.y=debug.y+debug.s
  end
  
end

function draw_debug()
  
  love.graphics.rectangle('fill',debug.x,debug.y,cellsize,cellsize)
end
