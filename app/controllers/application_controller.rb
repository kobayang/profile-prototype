class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def correct_user
    @user = User.find(params[:user_id])
    redirect_to root_path, alert: 'not correct user!' unless @user == current_user
  end
end
