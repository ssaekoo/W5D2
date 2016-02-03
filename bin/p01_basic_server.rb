require 'rack'
app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  name = req.params["name"]
  res['Content-Type'] = 'text/html'
  res.write("Hello #{name}")
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
