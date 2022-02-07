class AdviceService
  def random
    url = 'https://api.adviceslip.com/advice'
    conn = Faraday.new(url: url)
    response = conn.get

    JSON.parse(response.body, symbolize_names: true)
  end

  def search(query)
    url = "https://api.adviceslip.com/advice/search/#{query}"
    conn = Faraday.new(url: url)
    response = conn.get

    JSON.parse(response.body, symbolize_names: true)
  end
end
