
--generic input list
up=false
down=false
left=false 
right=false

tap_up=false
tap_down=false
tap_left=false
tap_right=false

x=false
z=false
c=false
v=false
d=false
space=false

rx=false
rc=false
rv=false

function control_toggle()
  if cutscene==false then
    controller_input()
  else
    up=false
    down=false
    left=false 
    right=false

    tap_up=false
    tap_down=false
    tap_left=false
    tap_right=false

    x=false
    --z=false
    c=false
    v=false

    rx=false
    rc=false
    rv=false

  end
end

function load_controllers()
    local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[1]
    deadzone = 0.25 
    s={}
    cursor = { x = 250, y = 250, speed = 200, useRawInput= false }
  

end

function controller_input()
--ALLOW KEYBOARD AND CONTROLLER INPUT IF CONTROLLLERS ARE PLUGGED IN
  if (joystick~=nil)then
    if love.keyboard.isDown("up") or joystick:isGamepadDown("dpup") then
      up=true
    else
      up=false
    end
    if love.keyboard.isDown("down") or joystick:isGamepadDown("dpdown") then
      down=true
    else
      down=false
    end
    if love.keyboard.isDown("left") or joystick:isGamepadDown("dpleft") then
      left=true
    else
      left=false
    end
    if love.keyboard.isDown("right") or joystick:isGamepadDown("dpright")then
      right=true
    else
      right=false
    end

    
--IF THERE ARE NO CONTROLLERS PLUGGED IN USE KEYBOARD CONTROLS
  else
    if love.keyboard.isDown("up") then
      up=true
    else
      up=false
    end
    if love.keyboard.isDown("down") then
      down=true
    else
      down=false
    end
    if love.keyboard.isDown("left") then
      left=true
    else
      left=false
    end
    if love.keyboard.isDown("right") then
      right=true
    else
      right=false
    end
  end
    
   
end

function love.keypressed(key)
  
  

  if key== "up" then
    tap_up=true
  end
  if key== "down" then
    tap_down=true
  end
  if key== "left" then

  end
  if key== "right" then
   
  end
  
  if key =="x" then
    x=true
  end 
  
  if key =="z" then
    z=true
  end 
  
  if key =="c" then
    c=true
  end 
  
  if key =="d" then
    d=true
  end 
  
  if key =="v" then
    v=true
  end 
  
  if key=="f4" then
    if fullscreen==true then
      love.window.setFullscreen(false)
      fullscreen=false
    elseif fullscreen==false then
      love.window.setFullscreen(true)
      fullscreen=true
  end
end
  
  if key=="escape"then
    love.event.push("quit")
  end
  
   if key == "tab" then
      local state = not love.mouse.isVisible()   -- the opposite of whatever it currently is
      love.mouse.setVisible(state)
   end
   
 
end

function love.keyreleased(key)
  if key =="x" then
    rx=true
  end
 
end

function love.gamepadpressed(joystick,button)
  --controller_pressed()
  if button=="a" then
    x=true
  end
   if button=="x" then
    z=true
  end
  if button=="dpup" then
    tap_up=true
  end
  if button=="dpdown" then
    tap_down=true
  end
  if button=="dpleft" then
    tap_left=true
  end
  if button=="dpright" then
    tap_right=true
  end
  if button=="start" then
    love.event.push('quit')
  end
  if button=="back" then
     if fullscreen==true then
      love.window.setFullscreen(false)
      fullscreen=false
    elseif fullscreen==false then
      love.window.setFullscreen(true)
      fullscreen=true
     end
  end
end

function love.gamepadreleased(joystick,button)
  --controller_released()
  if button=="a" then
    rx=true
  end
  if button=="x" then
    zx=true
  end
  
end



