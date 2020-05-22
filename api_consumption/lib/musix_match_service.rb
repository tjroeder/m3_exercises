require 'faraday'
require 'json'

class MusixMatchService
  def music_genres
    response = conn.get('music.genres.get')
    parse(response)
  end

  def tracks_from_artist(artist_name)
    response = conn.get('track.search') do |req|
      req.params['q_artist'] = artist_name
    end
    parse(response)
  end

  private
  def conn
    @conn ||= Faraday.new(
      url: "https://api.musixmatch.com/ws/1.1/",
      params: {apikey: ENV['MUSIXMATCH_KEY']}
    )
  end

  def parse(response)
    JSON.parse(response.body)
  end
end
