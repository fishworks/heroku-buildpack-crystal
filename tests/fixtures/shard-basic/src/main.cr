require "http/server"

port = ENV["PORT"] ||= "5000"

server = HTTP::Server.new(port.to_i) do |context|
  context.response.content_type = "text/plain"
  context.response.print "Hello World\n"
end

puts "Listening on http://0.0.0.0:#{port}"
server.listen
