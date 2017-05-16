require 'socket' 
#require 'uri'

server = TCPServer.new 12345

while session = server.accept
  request = session.gets
  puts request
  method, full_path = request.split(' ')
  if full_path.include? '?'
    path, queries = full_path.split('?')
  else
    path = full_path
    queries = None
  end

  response = "Hello World! #{Time.now}\n"
  #puts URI.parse(request).query
  if queries.include? '&'
    query_array = queries.split('&')
  else
    query_array = [queries]
  end

  query_array.times do |query|
    puts query
  end

  if params['dice']
    total = 0
    num = params['dice'].to_i
    num.times do |count|
      total += 1 + rand(6)
    end
    response = "I rolled a D6 #{num} times and totaled #{total}\n" 
  end

  session.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"

  session.print "\r\n"
  session.print response
  session.close
end
