

function make_sprites()
  tilesetImage = love.graphics.newImage( "tile1_a.png" )
  tilesetImage:setFilter("nearest", "linear") -- this "linear filter" removes some artifacts if we were to scale the tiles
  local tileSize = 32
  tileQuads={}
  -- blue
  tileQuads[0] = love.graphics.newQuad(0 , 0, tileSize, tileSize,960,1792)
  -- red
  tileQuads[1] = love.graphics.newQuad(0, 32, tileSize, tileSize,960,1792)
  -- green
  tileQuads[2] = love.graphics.newQuad(32, 0 , tileSize, tileSize,960,1792)
  -- yellow
  tileQuads[3] = love.graphics.newQuad(32, 32, tileSize, tileSize,960,1792)
  --Death block
  tileQuads[4] = love.graphics.newQuad(64, 0, tileSize, tileSize,960,1792)
  --Bounce block
  tileQuads[5] = love.graphics.newQuad(64, 32, tileSize, tileSize,960,1792)
  --Coins
  tileQuads[6] = love.graphics.newQuad(96, 0, tileSize, tileSize,960,1792)
  --boost pad
  tileQuads[7] = love.graphics.newQuad(96, 32, tileSize, tileSize,160,64)
  --Win Block
  tileQuads[8] = love.graphics.newQuad(128, 0, tileSize, tileSize,160,64)
  --Win Block
  tileQuads[9] = love.graphics.newQuad(128, 32, tileSize, tileSize,960,1792)
  --spawner
  tileQuads[10] = love.graphics.newQuad(0, 0, tileSize, tileSize,160,64)
  --Checkpoint marker
  tileQuads[11] = love.graphics.newQuad(0, 0, tileSize, tileSize,160,64)
  --Door
  tileQuads[12] = love.graphics.newQuad(0, 0, tileSize, tileSize,160,64)

end

