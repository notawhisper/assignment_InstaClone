class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :access_controll, only: [:edit, :update, :destroy]
  before_action :exclude_stranger

  def index
    @pictures = Picture.all
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def new
    @picture = Picture.new
  end

  def edit
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        PictureMailer.picture_mail(@picture).deliver
        redirect_to @picture, notice: '投稿されました.'
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: '編集しました.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: '削除しました.' }
      format.json { head :no_content }
    end
  end

  private
  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:image, :text, :user_id, :image_cache)
  end
end
