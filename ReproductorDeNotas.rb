live_loop :osc do
  nv=sync "/osc:127.0.0.1:<puerto>/message"
  # en <puerto> escribir el puerto de la ventana de ejecucion de processing de java
  
  print "X: " + nv[0].to_s
  print "Y: " + nv[1].to_s
  print "Size: " + nv[2].to_s
end
