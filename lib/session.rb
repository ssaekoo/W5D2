require 'json'
require 'byebug'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req, session = {})
    @session = session
    @cookie = req.cookies["_rails_lite_app"]
    @session = JSON.parse(@cookie) if @cookie
  end

  def [](key)
    @session[key]
  end

  def []=(key, val)
    @session[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    cookie = {}
    cookie[:path] = '/'
    cookie[:value] = @session.to_json
    res.set_cookie("_rails_lite_app", cookie)
  end
end
