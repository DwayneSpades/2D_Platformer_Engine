

camera={
  x=0,
  y=0,
  scale_x=1,
  scale_y=1,
  rot=0,
  }

function camera:create_cam()
  windowWidth = 1280
    windowHeight = 720
    local bx,by = love.graphics.getDimensions( )
        bscalex = (bx/windowWidth)
        bscaley = (by/windowHeight)
    love.graphics.push()
    love.graphics.rotate(self.rot)
    love.graphics.scale(bscalex,bscaley)
    love.graphics.translate(-self.x,-self.y)
    
end

function camera:pop()
    love.graphics.pop()
end

function camera:set_cam(x,y)
    self.x,self.y=x,y
end

function camera:follow(x,y)
  if fullscreen then
  self.x=(x-(love.graphics.getWidth()/2))*1
  self.y=(y-(love.graphics.getHeight()/2))*1
  elseif fullscreen==false then
  self.x=(x-(love.graphics.getWidth()/2))*0.7
  self.y=(y-(love.graphics.getHeight()/2))*0.6
  end

end

function scale_screen()
if fullscreen==true then
--love.graphics.scale(1,1)
--love.graphics.translate(0,0)
elseif fullscreen==false then
love.graphics.scale(0.7,0.6)
love.graphics.translate((love.graphics.getWidth()/2)*0.7,(love.graphics.getHeight()/2)*0.6)
end
end

function screen_origin()
fullscreen=true
if fullscreen then
  love.window.setFullscreen(true)
elseif fullscreen==false then
  love.window.setFullscreen(false)
end
end
function draw_in_world()
  
end
function draw_camera()
 
end
