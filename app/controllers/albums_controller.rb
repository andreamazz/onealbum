class AlbumsController < ApplicationController
  include AmazonAlbumArt
  
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def cover
    client = AmazonAlbumArt.new(AMAZON_KEY['key'], AMAZON_KEY['secret'], AMAZON_KEY['associate'])
    res = client.search("phish", "rift")

    # :artist=>"Phish", :album=>"Rift", :images=>{:swatch=>"http://ecx.images-amazon.com/images/I/511RmbQV7dL._SL30_.jpg", :small=>"http://ecx.images-amazon.com/images/I/511RmbQV7dL._SL75_.jpg", :thumbnail=>"http://ecx.images-amazon.com/images/I/511RmbQV7dL._SL75_.jpg", :tiny=>"http://ecx.images-amazon.com/images/I/511RmbQV7dL._SL110_.jpg", :medium=>"http://ecx.images-amazon.com/images/I/511RmbQV7dL._SL160_.jpg", :large=>"http://ecx.images-amazon.com/images/I/511RmbQV7dL.jpg"}}
  end

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render action: 'show', status: :created, location: @album }
      else
        format.html { render action: 'new' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :author, :rating, :text, :user_id)
    end
end
