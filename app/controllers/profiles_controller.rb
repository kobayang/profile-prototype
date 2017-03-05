class ProfilesController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile
    @has_user_profile = @profile.present?
  end

  def edit
    @user = current_user
    @profile = @user.profile
    if @profile.nil?
      @profile = @user.profile = Profile.new
    end
    @profile.skills.build
  end

  def update
    if current_user.profile.nil?
      current_user.profile = Profile.new(profile_params)
      check_and_redirect current_user.profile.save
    else
      check_and_redirect current_user.profile.update(profile_params)
    end
  end

  private

    def profile_params
      params.require(:profile).permit(
        :name,
        skills_attributes: [
          :id,
          :name
        ]
      )
    end

    def correct_user
      @user = User.find(params[:user_id])
      redirect_to root_path, alert: 'not correct user!' unless @user == current_user
    end

    def check_and_redirect exec
      if exec
        redirect_to user_profile_path(@user), notice: 'save user profile success'
      else
        redirect_to user_profile_path(@user), alert: 'save user profile failed'
      end
    end

end
