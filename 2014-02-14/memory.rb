require 'sinatra/base'
 
app = Sinatra.new do
  get('/') { "ok" }
end
 
count_was  = 0
changed_at = 0
iteration  = 0
run = true
 
trap :INT do
  run = false
  puts "\nObject count stayed at #{count_was} after #{changed_at} iterations"
  exit 0
end
 
while run
  iteration += 1
  app.call({'REQUEST_METHOD' => 'GET', 'PATH_INFO' => '', 'rack.input' => ''})
  #GC.start if ENV['RUN_GC'] == '1'
  count = ObjectSpace.count_objects
  count_was, changed_at = count[:TOTAL], iteration if count[:TOTAL] != count_was
  print "Iteration: #{iteration.to_s.ljust(10)} TOTAL=#{count[:TOTAL]} FREE=#{count[:FREE]}\r"
end