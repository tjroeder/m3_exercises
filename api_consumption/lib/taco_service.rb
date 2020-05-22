require 'faraday'
require 'json'

class TacoService
  def random_ingredients
    response = conn.get("random/")
    parse(response)
  end

  def random_taco
    response = conn.get("random/?full-taco=true")
    parse(response)
  end

  def contributions(username)
    response = conn.get("contributions/#{username}/")
    parse(response)
  end

  def ingredients_by_type(type)
    response = conn.get("#{type}/")
    parse(response)
  end

  def contributors_by_ingredient(type, ingredient)
    response = conn.get("contributors/#{type}/#{ingredient}/")
    parse(response)
  end

  private
  def conn
    @conn ||= Faraday.new(
      url: "http://taco-randomizer.herokuapp.com/"
    )
  end

  def parse(response)
    JSON.parse(response.body)
  end
end
