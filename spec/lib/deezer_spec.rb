require 'spec_helper'
include Deezer

describe Deezer do
  
  it 'returns an array containing the album info (artist, artist_id, title, id, cover)', slow: true do
    client = Fetcher.new()
    result = client.search_albums_from_artist 'Clapton'
    expect(result[0]).to include :artist
    expect(result[0]).to include :artist_id
    expect(result[0]).to include :title
    expect(result[0]).to include :id
    expect(result[0]).to include :cover
  end
  
end