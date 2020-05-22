require 'faraday'
require 'json'
require 'digest'

class MarvelService
  def character(name)
    params = marvel_params.merge({name: name})
    response = conn.get('characters') do |req|
      req.params = params
    end
    parse(response)
  end

  def creators(attributes)
    camelized_attributes = camelize_keys(attributes)
    params = marvel_params.merge(camelized_attributes)
    response = conn.get('creators') do |req|
      req.params = params
    end
    parse(response)
  end

  private
  def conn
    Faraday.new(
      url: "http://gateway.marvel.com/v1/public/",
    )
  end

  def parse(response)
    JSON.parse(response.body)
  end

  def marvel_params
    timestamp = get_timestamp
    hash = marvel_hash(timestamp)
    {
      ts: timestamp,
      apikey: ENV['MARVEL_PUBLIC'],
      hash: hash
    }
  end

  def get_timestamp
    Time.now.getutc.to_s
  end

  def marvel_hash(timestamp)
    input = timestamp + ENV['MARVEL_PRIVATE'] + ENV['MARVEL_PUBLIC']
    Digest::MD5.hexdigest(input)
  end

  def camelize_keys(hash)
    hash.map do |k, v|
      [camelize(k.to_s), v]
    end.to_h
  end

  def camelize(string)
    split = string.split("_").map.with_index do |word, index|
      index >= 1 ? word.capitalize : word
    end.join("")
  end
end
