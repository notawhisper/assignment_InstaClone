class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def access_controll
    if @picture.present?
      unless current_user.id == @picture.user_id
        flash[:notice] = "本人のみにアクセスが許可されています。"
        redirect_to pictures_path
      end
    elsif @user.present?
      unless current_user.id == @user.id
        flash[:notice] = "本人のみにアクセスが許可されています。"
        redirect_to pictures_path
      end
    else
    end
  end

  def exclude_stranger
    unless logged_in?
      flash[:notice] = "ログインしてください。"
      redirect_to new_user_path
    end
  end
end
