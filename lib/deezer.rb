require 'open-uri'
require 'JSON'

module Deezer

  # http://api.deezer.com/2.0/search/album?q=artist
  class Fetcher
  
    def search_albums_from_artist artist
      albums = URI "http://api.deezer.com/2.0/search/album"
      albums.query = URI.encode_www_form({
        :q  => artist
      })

      json = JSON.parse open(albums).read
      json["data"].map { |album| { 
        artist: album["artist"]["name"], 
        artist_id: album["artist"]["id"], 
        title: album["title"], 
        id: album["id"], 
        cover: album["cover"] } 
      }
    end
    
  end
end