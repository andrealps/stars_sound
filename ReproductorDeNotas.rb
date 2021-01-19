live_loop :osc do
  nv=sync "/osc:127.0.0.1:<puerto>/message"
  # en <puerto> escribir el puerto de la ventana de ejecucion de processing de java
  
  size=nv[0].to_f
  print "Size: " + size.to_s
  time=nv[1].to_f
  
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
  
  use_bpm 10000
  use_synth :piano
  play hz_to_midi(noteToPlay), release:time, amp:1
  sample :ambi_piano, amp:0.1, release:time
  
end
