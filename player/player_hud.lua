require 'player/player'
function load_hud()
  hud={}
  hud.health=p.health
  hud.scale=p.health
  hud.width=196
  hud.height=32
  hud.x=camera.x+120
  hud.y=camera.y+64
  coins_collected=0

    
    
end

function update_hud()
  hud.health=p.health
  if (hud.health<=0) then
    hud.health=0
  end
  hud.x=camera.x+120
  hud.y=camera.y+64
  
 
   
 
end

function draw_hud()
  love.graphics.setColor(0,1,0,0.5)
  love.graphics.rectangle('fill',hud.x,hud.y,hud.health,hud.height)
  love.graphics.setColor(1,1,0,1)
  love.graphics.print('Coins Collected: '..coins_collected..'',hud.x,hud.y-32)
  love.graphics.print('Debug press C or V: '..item..'',hud.x,hud.y+32)
  love.graphics.print('X: '..selectedX..'Y: '..selectedY..'',hud.x,hud.y+64)
   
  if cutscene then
    love.graphics.setColor(0.3,0.3,0.5,1)
    love.graphics.rectangle('fill',hud.x-200,hud.y-300,1800,300)
    love.graphics.rectangle('fill',hud.x-200,hud.y+600,1800,300)
  end
end

