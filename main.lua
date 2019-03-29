require 'maps/map_1'
require 'maps/map_2'
require 'maps/map_3'
require 'maps/map_4'
require 'misc/algs'
require 'misc/camera'
require 'misc/collision'
require 'player/player'
require 'player/controller'
require 'player/player_hud'
require 'player/menu_c'
require 'enemies/drone'
require 'states/play_states'
require 'states/master_stateswitch'
require 'collectables/coins'
--I'm puting this project on hiatus for now. remember that the next thing to be done could be 
--List~
--Enemies
--moving platforms  CHECK
--one way blocks  CHECK
--OOP --eat your vegtables
--npc's
--text boxes  CHECK
--scrolling text? CHECK
--bullet patterns
--make level editor more robust
--Design an actual game!!!

function love.load()
     
  load_level()
  start_game()
end

function love.update(dt)
    
  update_state()
    
end

function love.draw()
  draw_state()
  
end



