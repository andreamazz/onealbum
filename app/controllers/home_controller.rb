class HomeController < ApplicationController
  include AmazonAlbumArt
  
  def index
    
    client = AmazonAlbumArt.new(AMAZON_KEY['key'], AMAZON_KEY['secret'], AMAZON_KEY['associate'])
    res = client.search("phish", "rift")
    puts "\n\n\n#{res}\n\n\n"
  end
end
