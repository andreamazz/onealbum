class HomeController < ApplicationController
  include Deezer
  
  def index
    
    client = Fetcher.new()
    data = client.search_albums_from_artist 'john mayer'
    # puts data

  end
end
