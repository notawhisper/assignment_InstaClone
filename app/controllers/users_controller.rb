class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :access_controll, only: [:show, :edit, :update, :destroy]
  before_action :exclude_stranger, except: [:new, :create]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = '登録完了しました'
      redirect_to @user
    else
      render :new
    end
  end

  def update
     if @user.update(user_params)
       redirect_to @user, notice: "プロフィールを編集しました！"
     else
       render :edit
     end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'アカウントを削除しました.' }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password_digest, :password, :image, :image_cache)
  end
end
