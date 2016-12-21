require 'json'

class Session
  def initialize(req)
    cookie = req.cookies['_the_rails']
    @data = cookie ? JSON.parse(cookie) : {}
  end

  def [](key)
    @data[key]
  end

  def []=(key, val)
    @data[key] = val
  end

  def store_session(res)
    cookie = {path: '/', value: @data.to_json}
    res.set_cookie('_the_rails', cookie)
  end
end
