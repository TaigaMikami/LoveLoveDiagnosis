class PhotosController < ApplicationController

  require 'emotion'
  def index
    @photo = Photo.last
    @love = azure(@photo.two_shot)
    @two_shot = File.basename(@photo.two_shot)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(
      boy_name: params[:boy_name],
      girl_name: params[:girl_name],
      two_shot: params[:two_shot]
    )
    if @photo.save
      redirect_to("/photos/index")
    else
      render("/photos/new")
    end
  end
end
