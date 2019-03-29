function load_cutscenes()
  cutscene_1=false
  cutscene_2=false
  message={a=false,a1=false,a2=false,a3=false,a4=false}
  c_s=1
end
--just create dialogue
function cutscene_handler()
    if p.x> 29*16 and cutscene==false and message.a==false then
    cutscene=true
    message.a=true
    create_diag("Heres How you play:    \nright arrow move right, left arrow move left, x to jump, z to prgress text.",hud.x+500,   hud.y+650,200,200)
  create_diag("hold left or right into walls while falling to slow your fall.\n press down while holding left or right into the wall to fall down quicker.",hud.x+500,hud.y+650,200,200)
  end

  
  if z and diag_fin  then
    diag_fin=false
    c_s=c_s+1
    --table.remove(diag,1)
  end
  z=false

end