class SkillsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.find(params[:user_id])
    @profile = @user.profile
    @skill = Skill.new

    if @user.nil? or @user.profile.nil?
      redirect_to root_path, alert: "no exists such account"
    end
  end

  def create
    user = User.find(params[:user_id])

    begin
      skill = find_by_or_new_skill(skill_params)
      user.profile.skills << skill
      redirect_user_page user
    rescue ActiveRecord::RecordInvalid
      redirect_to user_profile_path(user), alert: "save skill failed"
    rescue ActiveRecord::RecordNotUnique
      redirect_to user_profile_path(user), alert: "not unique skill name"
    end
  end

  private

    def skill_params
      params.require(:skill).permit(:name)
    end

    def find_by_or_new_skill params
      skill = Skill.find_by(params)
      if skill
        return skill
      else
        return Skill.create!(params)
      end
    end

    def redirect_user_page user
      if user == current_user
        redirect_to edit_user_profile_path(user)
      else
        redirect_to user_profile_path(user)
      end
    end
end
