live_loop :osc do
  nv=sync "/osc:127.0.0.1:52076/message"
  # en <puerto> escribir el puerto de la ventana de ejecucion de processing de java
  
  x=nv[0].to_f
  y=nv[1].to_f
  size=nv[2].to_f
  
  print "X: " + x.to_s
  print "Y: " + y.to_s
  print "Size: " + size.to_s
  
  doNote=261.63
  miNote=329.628
  solNote=391.995
  
  noteToPlay=0
  
  case size
  when 50.0
    noteToPlay=doNote
  when 35.0
    noteToPlay=miNote
  when 20.0
    noteToPlay=solNote
  else
    print "Incorrect weight"
  end
  
  play hz_to_midi(noteToPlay)
  sleep 3
  
  
end


define :escalar do |oldMin,oldMax,newMin,newMax,oldValue|
  newValue = (((oldValue - oldMin) * (newMax - newMin)) / (oldMax - oldMin)) + newMin
  return newValue
end

