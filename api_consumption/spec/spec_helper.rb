require 'rspec'
require 'dotenv'
require 'json'
require 'pry'
require 'vcr'
require 'faraday'
require 'faraday/net_http'

Faraday.default_adapter = :net_http

Dotenv.load

Dir["./lib/*.rb"].each { |file| require file }

VCR.configure do |c|
  c.cassette_library_dir = "spec/vcr"
  c.hook_into :faraday
  c.configure_rspec_metadata!
  # c.define_cassette_placeholder("<API_KEY>", ENV["API_KEY"])
end
