require 'spec_helper'

describe AlbumsController do
  
  describe 'GET #index' do
    
    let(:today) { Date.today }
    let(:last_month) { Date.today - 1.month }
    let(:previous_1) { create(:album, date: Date.new(last_month.year, last_month.month, 1)) }
    let(:previous_15) { create(:album, date: Date.new(last_month.year, last_month.month, 15)) }
    let(:current_1) { create(:album, date: Date.new(today.year, today.month, 1)) }
    let(:current_15) { create(:album, date: Date.new(today.year, today.month, 15)) }
    
    context 'with params[:year] and params[:month]' do
      before :each do
        get :index, year: last_month.year, month: last_month.month # ask for the albums of the previous month
      end
      
      it 'populates an array of albums for the given month' do
        expect(assigns(:albums)).to match_array([previous_1, previous_15])
      end
      
      it 'renders the :index view' do
        expect(response).to render_template :index
      end
    end
    
    context 'with no params' do
      before :each do
        get :index
      end
      
      it 'populates an array of albums for the current month' do
        expect(assigns(:albums)).to match_array([current_1, current_15])
      end
      
      it 'renders the :index view' do
        expect(response).to render_template :index
      end
    end
  end
  
  describe 'GET #find_album' do
    it 'renders the :find_album view' do
      result = { artist: 'Eric Clapton', artist_id: '0', title: 'Slowhand', id: '6227255', cover: 'http://api.deezer.com/2.0/album/6227255/image' }
      # Using a mock and a stub for the remote call. Test the Deezer fetcher in lib/deezer_spec
      allow(Album).to receive(:search_deezer_albums_from_artist).and_return([result])
      get :find_album, query: 'clapton', format: :js
      expect(response).to render_template :find_album
    end
  end
  
  describe 'GET #show' do
    before :each do
      @album = create(:album)
      get :show, id: @album
    end
    
    it 'assigns the requested album to @album' do
      expect(assigns(:album)).to eq @album
    end
    
    it 'renders the :show template' do
      expect(response).to render_template :show
    end
  end
  
  describe 'GET #new' do
    before :each do
      user = create(:user)
      sign_in :user, user
      get :new
    end
    it 'assigns a new Album to @album' do
      get :new
      expect(assigns(:album)).to be_a_new(Album)
    end
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end
  
  describe 'GET #edit' do
    before :each do
      user = create(:user)
      sign_in :user, user
      @album = create(:album)
      get :edit, id: @album
    end
    
    it 'assigns the requested album to @album' do
      expect(assigns(:album)).to eq @album
    end
    
    it 'renders the :edit template' do
      expect(response).to render_template :edit
    end
  end
  
  describe 'POST #create' do
    before :each do
      user = create(:user)
      sign_in :user, user
    end
    context 'with valid attributes' do
      it 'saves the new album in the database' do
        expect {
          post :create, album: attributes_for(:album)
        }.to change(Album, :count).by(1)
      end
      it 'redirects to albums#index' do
        post :create, album: attributes_for(:album)
        expect(response).to redirect_to albums_path
      end
    end
    
    context 'with invalid attributes' do
      it 'does not save the new album in the database' do
        expect {
          post :create, album: attributes_for(:invalid_album)
        }.to_not change(Album, :count).by(1)
      end
      it 're-renders the :new template' do
        post :create, album: attributes_for(:invalid_album)
        expect(response).to render_template :new
      end
    end
  end
  
  describe 'PATCH #update' do
    before :each do
      user = create(:user)
      sign_in :user, user
      @album = create(:album, title: 'Title', author: 'Author', rating: CONSTANTS[:rating][:min])
    end
    
    context 'with valid attributes' do
      it 'updates the album in the database' do
        patch :update, id: @album, album: attributes_for(:album, title: 'Slowhand', author: 'Eric Clapton', rating: CONSTANTS[:rating][:max])
        @album.reload
        expect(@album.title).to eq('Slowhand')
        expect(@album.author).to eq('Eric Clapton')
        expect(@album.rating).to eq(CONSTANTS[:rating][:max])
      end
      
      it 'redirects to album' do
        patch :update, id: @album, album: attributes_for(:album)
        expect(response).to redirect_to @album
      end
    end
    
    context 'with invalid attributes' do
      it 'does not save the new album in the database' do
        patch :update, id: @album, album: attributes_for(:album, title: 'Slowhand', author: nil)
        @album.reload
        expect(@album.title).to_not eq('Slow Hand')
      end
      it 're-renders the :edit template' do
        patch :update, id: @album, album: attributes_for(:album, title: 'Slowhand', author: nil)
        expect(response).to render_template :edit
      end
    end
  end
  
  describe 'DELTE #destroy' do 
    before :each do
      user = create(:user)
      sign_in :user, user
      @album = create(:album)
    end
    
    it 'deletes the album from the database' do
      expect {
        delete :destroy, id: @album
      }.to change(Album, :count).by(-1)
    end
    
    it 'redirects to album#index' do
      delete :destroy, id: @album
      expect(response).to redirect_to albums_url
    end
  end
  
end
