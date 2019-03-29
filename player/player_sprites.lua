

function p_sprites()
  p_sprites = love.graphics.newImage( "eva.png" )
  p_sprites:setFilter("nearest", "linear") -- this "linear filter" removes some artifacts if we were to scale the tiles
  local tileSize = 32
  p_spr={}
  -- blue
  p_spr[0] = love.graphics.newQuad(0 , 0, 64, 128, 64,128)
  -- red
  p_spr[1] = love.graphics.newQuad(32, 0, tileSize, tileSize,64,128)
  -- green
  p_spr[2] = love.graphics.newQuad(96, 0 , tileSize, tileSize,160,32)
  -- yellow
  p_spr[3] = love.graphics.newQuad(128, 0, tileSize, tileSize,160,32)
  --Death block
  p_spr[4] = love.graphics.newQuad(160, 0, tileSize, tileSize,160,32)
  
end
