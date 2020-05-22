require 'faraday'
require 'json'

class ChuckService
  def random
    response = conn.get('random')
    parse(response)
  end

  def random_in_category(category)
    response = conn.get("random?category=#{category}")
    parse(response)
  end

  def categories
    response = conn.get("categories")
    parse(response)
  end

  def search(term)
    response = conn.get("search?query=#{term}")
    parse(response)
  end

  private
  def conn
    @conn ||= Faraday.new(
      url: "https://api.chucknorris.io/jokes/"
    )
  end

  def parse(response)
    JSON.parse(response.body)
  end
end
