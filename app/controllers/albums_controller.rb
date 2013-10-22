class AlbumsController < ApplicationController
  
  before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_album, only: [:show, :edit, :update, :destroy]  

  respond_to :html, :json, :js

  # GET /find_album?query=artist
  def find_album
    @data = Album.search_deezer_albums_from_artist params[:query]
  end

  # GET /albums?month=1&year=2013
  # GET /albums.json
  def index
    if params[:month] and params[:year]
      @date = Date.new params[:year].to_i, params[:month].to_i, 1
    else
      @date = Date.new Date.today.year, Date.today.month, 1
    end
    @albums = Album.albums_for_month_and_year @date.month, @date.year
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
        format.html { redirect_to albums_path, notice: 'Album was successfully created.' }
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
      params.require(:album).permit(:title, :author, :rating, :text, :cover, :date, :deezer_id).merge(user_id: current_user.id)
    end
end
