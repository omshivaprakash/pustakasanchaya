class Book

  BASE_URL = Rails.env == "development" ? 'http://localhost:3001' : 'http://samooha.sanchaya.net'
  # BASE_SEARCH_URL = Rails.env == "development" ? 'http://localhost:3001/search.json?search=' : 'http://samooha.sanchaya.net/search.json?search='
  BASE_SEARCH_URL = 'http://samooha.sanchaya.net/search.json?search='

  def self.search params
    search_items = params.squish
    full_url = "#{BASE_SEARCH_URL}#{search_items}"
    parsed_url = URI.parse(URI.encode(full_url))
    response = HTTParty.get parsed_url
    return response.body
  end

  def self.categories
    full_url = "#{BASE_URL}/categories"
    parsed_url = URI.parse(URI.encode(full_url))
    response = HTTParty.get parsed_url
    return response.body
  end

  def self.category_books(id)
    full_url = "#{BASE_URL}/categories/#{id}"
    parsed_url = URI.parse(URI.encode(full_url))
    response = HTTParty.get parsed_url
    return response.body
  end

end
