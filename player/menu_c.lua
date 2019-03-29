
function controls_load()
  love.mouse.setVisible(false)
 
end

function controls_update()

end


function love.mousepressed(x,y,button,isTouch)
   
  if button==1 then
    print("left_pressed")
    left_click=true
    
  end
  if button==2 then
    right_click=true
    print("right_pressed")
  end
  
end

function mouse_update()
   right_click=false
  --[[if love.mouse.isDown(1) then
    left_click=true
    print("left_click")
  else
    left_click=false
  end
  
  if love.mouse.isDown(2) then
    right_click=true
    print("right_click")
  else
    right_click=false
  end]]
  
end
function mouse_draw()
 
  
end

function love.mousereleased(x,y,button,isTouch)
  if button==1 then
   -- print("left_pressed")
  left_click=false
  end
  if button==2 then
    --print("right_pressed")
    --right_click=false
  end
  if button==3 then
   -- print("middle_pressed")
  end
  if button==4 then
  -- print("left_side_pressed")
  end
  if button==5 then
    --print("right_side_pressed")
  end
end



