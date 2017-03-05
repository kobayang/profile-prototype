class EvaluatorsController < ApplicationController

  def create
    # LinkからPostしているため、URLからparamsを取得する
    user = User.find(params[:user_id])
    skill_relation = ProfileSkill.find(params[:profile_skill_id])

    begin
      skill_relation.evaluators << user
      redirect_back fallback_location: root_path
    rescue ActiveRecord::RecordInvalid
      redirect_back fallback_location: root_path, alert: "save evaluation failed"
    rescue ActiveRecord::RecordNotUnique
      redirect_back fallback_location: root_path, alert: "already save evaluator"
    end
  end

end