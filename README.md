# Introduction

This server is a very simple server that is used to teach the HTTP request/response cycle. It is using ruby version 2.4.

To run the server, simply run
`ruby server.rb`

You can browse to `http://localhost:12345` to see the basic **Hello World! <Current Time>** message. However, we will be using cURL to access this server.

# What makes up the URL

A typical url will be made up by [protocol:] // [hostname] [:port] [abs_path] [ "?" query]

# HTTP GET

To do an HTTP GET, you can just run `curl URL`.

For our server, `curl http://localhost:12345` will work. It is a good habit to wrap the URL in double quotes, as some characters (such as **&**) will be processed as shell commands and not part of the URL. 

For more information, please refer to the [HTTP/1.1 specification](https://www.w3.org/Protocols/rfc2616/rfc2616.html)
