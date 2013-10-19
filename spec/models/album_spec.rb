require 'spec_helper'

describe Album do
  
  it 'is valid with title, author, rating, text, cover, date and deezer_id' do
    album = Album.new(
      title: 'Texas Flood',
      author: 'Stevie Ray Vaughan and Double Trouble',
      rating: 5,
      text: 'Amazing album',
      date: Date.today,
      cover: 'http://api.deezer.com/2.0/album/6227255/image',
      deezer_id: '6227255')
    expect(album).to be_valid
  end
  
  it 'is invalid without title' do
    expect(Album.new(title: nil)).to have(1).errors_on(:title)
  end
  
  it 'is invalid without author' do
    expect(Album.new(author: nil)).to have(1).errors_on(:author)
  end
  
  it 'is invalid without rating' do
    expect(Album.new(rating: nil)).to have(1).errors_on(:rating)
  end
  
  it 'is invalid without date' do
    expect(Album.new(date: nil)).to have(1).errors_on(:date)
  end
  
  it 'is invalid with rating below limit' do
    expect(Album.new(rating: CONSTANTS[:rating][:min] - 1)).to have_at_least(1).errors_on(:rating)
  end

  it 'is invalid with rating above limit' do
    expect(Album.new(rating: CONSTANTS[:rating][:max] + 1)).to have_at_least(1).errors_on(:rating)
  end

  describe 'list albums for a given month and year' do
    before :each do
      @october_1 = Album.create(title: 'Title1', author: 'Author', rating: 4, date: Date.new(2013, 10, 1))
      @october_15 = Album.create(title: 'Title2', author: 'Author', rating: 3, date: Date.new(2013, 10, 15))
      @november_1 = Album.create(title: 'Title3', author: 'Author', rating: 1, date: Date.new(2013, 11, 1))
    end
    
    context 'matching albums' do
      it 'returns an array of albums for the correct month' do
        expect(Album.albums_for_month_and_year(10, 2013)).to eq [@october_1, @october_15]
      end
    end
    
    context 'non-matching albums' do
      it 'returns an array of albums for the correct month' do  
        expect(Album.albums_for_month_and_year(10, 2013)).to_not include @november_1
      end
    end
  end

end