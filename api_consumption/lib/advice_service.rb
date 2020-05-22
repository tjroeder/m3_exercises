require 'faraday'
require 'json'

class AdviceService
  def random
    response = conn.get("advice")
    parse(response)
  end

  def search(term)
    response = conn.get("advice/search/#{term}")
    parse(response)
  end

  private
  def conn
    @conn ||= Faraday.new(
      url: "https://api.adviceslip.com/"
    )
  end

  def parse(response)
    JSON.parse(response.body)
  end
end
