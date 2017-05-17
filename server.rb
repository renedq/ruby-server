require 'socket' 
require 'cgi'

server = TCPServer.new 12345

while socket = server.accept
  request = socket.gets
  method, full_path = request.split(' ')
  params = {}
  if full_path.include? '?'
    path, queries = full_path.split('?')
    params = CGI::parse(queries)
  end

  response = "Hello World! #{Time.now}\n"
  if params.key?('dice') and params['dice']
    total = 0
    details = ""
    num = params['dice'][0].to_i
    if num == 0
        response = "You need to specify a number greater than zero\n"
    else
      num.times do |count|
        roll = 1 + rand(6)
        total += roll
        details << "[#{roll}] "
      end
      response = "I rolled a D6 #{num} times and totaled #{total}\n"
      if params.key?('details') and params['details'][0].downcase == "true"
        response << "Individual rolls: #{details}\n" 
      end
    end
  end

  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"

  socket.print "\r\n"
  socket.print response
  socket.close
end
