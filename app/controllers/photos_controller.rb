class PhotosController < ApplicationController

  require 'emotion'
  def index
    @photo = Photo.last
    @love = lovePower(@photo.boy_img_name, @photo.girl_img_name)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(
      boy_name: params[:boy_name],
      boy_img_name: params[:boy_img_name],
      girl_name: params[:girl_name],
      girl_img_name: params[:girl_img_name]
    )
    if @photo.save
      redirect_to("/photos/index")
    else
      render("/photos/new")
    end
  end
end
