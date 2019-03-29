function load_diag()
  diag={}
end
function create_diag(text,posx,posy,wl,hl)
  sa={
    t=text,
    string={},
    x=posx,
    y=posy,
    w=4,
    h=16,
    pos_t='',
    lim=0,
    tmp_w=0,
    index=1,
    speed=10,
    timer=0,
    indented=false
  }
  
  local i = 1

  for c in text:gmatch('.') do
    sa.string[i] = c
    i = i + 1
  end
  table.insert(diag,sa)
end

function update_text()
  
  for i,v in ipairs(diag) do
    if c_s==i then
    v.timer=v.timer+v.speed
      if v.timer>=4 and v.index<=#v.t then
        v.pos_t=v.pos_t ..tostring(v.string[v.index])
        v.index=v.index+1
      v.lim=v.lim+6
       if tostring(v.string[v.index])=='\n' then
         v.h=v.h+16
         v.lim=0
       elseif v.lim>=v.tmp_w then
        v.w=v.w+6
        v.tmp_w=v.w
      end 
       v.timer=0
      elseif v.index>=#v.t+1 then
        diag_fin=true
      end
 
      v.indented=false
    
  end
  end
end

function draw_diag()
    for i,v in ipairs(diag) do
      if c_s==i then
        love.graphics.print(v.pos_t,hud.x+104,hud.y+600,0,2,2) 
    elseif c_s>#diag then
      diag={}
      c_s=1
      cutscene=false
      break
      end
      --love.graphics.rectangle('line',hud.x+500,hud.y+650,v.w,v.h)
    end
    
end
