class ChuckService
  def random
    url = 'https://api.chucknorris.io/jokes/random'
    conn = Faraday.new(url: url)
    response = conn.get

    JSON.parse(response.body)
  end

  def random_in_category(sel_category)
    url = 'https://api.chucknorris.io/'
    conn = Faraday.new(url: url)
    response = conn.get('jokes/random', { category: sel_category })

    JSON.parse(response.body)
  end
  
  def categories
    url = 'https://api.chucknorris.io/'
    conn = Faraday.new(url: url)
    response = conn.get('jokes/categories')

    JSON.parse(response.body)
  end

  def search(query)
    url = 'https://api.chucknorris.io/'
    conn = Faraday.new(url: url)
    response = conn.get('jokes/search', { query: query})

    JSON.parse(response.body)
  end
end