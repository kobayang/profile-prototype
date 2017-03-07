class ProfileSkillsController < ApplicationController
  before_action :correct_user, only: [:destroy]

  def destroy
    user = current_user
    user_skill = ProfileSkill.find(params[:id])
    if user_skill.profile != user.profile
      return redirect_back fallback_location: root_path, alert: "no user error"
    end

    if user_skill.destroy
      redirect_back fallback_location: root_path, alert: "delete skill success"
    else
      redirect_back fallback_location: root_path, alert: "delete skill failure"
    end
  end

end
