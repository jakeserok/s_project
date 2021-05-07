class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:title, :image)
    end
end
