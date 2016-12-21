require 'json'

class Flash

  attr_reader :now

  def initialize(req)
    cookie = req.cookies['_the_rails']
    @now = cookie ? @JSON.parse(cookie) : {}
    @flash = {}
  end

  def [](key)
    @now[key.to_s] || @flash[key.to_s]
  end

  def []=(key, val)
    @flash[key.to_s] = val
  end

  def store_flash(res)
    flash = {path: '/', value: @flash.to_json}
    res.set_cookie('_the_rails', flash)
  end

end
