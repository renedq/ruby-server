# Introduction

This server is a very simple server that is used to teach the HTTP request/response cycle. It is using ruby version 2.4.

To run the server, simply run
`ruby server.rb`

You can browse to `http://localhost:12345` to see the basic **Hello World! <Current Time>** message. However, we will be using cURL to access this server.

# What makes up the URL

A typical url will be made up by [protocol:] // [hostname] [:port] [abs_path] [ "?" query]

The protocol will usually be `http:` (HyperText Transfer Protocol), or `https:` (HyperText Transfer Protocol Secure). Usually, HTTP uses port 80 to send and receive packets over the web, while HTTPS uses port 443. Both HTTP and HTTPS use the TCP (Transmission Control Protocol). 

Some differences between HTTP and HTTPS include:
* URL in address bar.
* HTTP is unsecured while HTTPS is secured.
* HTTP opeates at application layer and HTTPS operates at the transport layer. For more information, take a look at the [OSI Model](https://www.tutorialspoint.com/ipv4/ipv4_osi_model.htm).
* You need a signed SSL certificate for HTTPS.
* HTTP doesn't require domain validation, where as HTTPS requires it.
* There is no encryption with HTTP, and HTTPS encrypts the data before sending. 

# HTTP GET

To do an HTTP GET, you can just run `curl URL`.

For our server, `curl http://localhost:12345` will work. It is a good habit to wrap the URL in double quotes, as some characters (such as **&**) will be processed as shell commands and not part of the URL. 

For more information, please refer to the [HTTP/1.1 specification](https://www.w3.org/Protocols/rfc2616/rfc2616.html)
