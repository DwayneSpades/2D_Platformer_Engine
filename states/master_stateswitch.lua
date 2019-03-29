require 'misc/misc'
require 'states/play_states'
require 'states/Title_state'
require 'states/menu_state'
state=0

function start_game()
  --[[local states={}
  recursiveEnumerate('states', states)
  requireFiles(states)]]
  
  
 -- current_map=levels[1]
  
  if state==0 then
    start_titlescreen()
  elseif state==1 then
    start_playstate()
  elseif state==2 then
    start_pause()
  end
end

function update_state()
  if state==0 then
    update_titlescreen()
  elseif state==1 then
    update_playstate()
  elseif state==2 then
    update_pause()
  end
end

function draw_state()
  if state==0 then
    draw_titlescreen()
  elseif state==1 then
    draw_playstate()
  elseif state==2 then
    draw_pause()
  end
end
