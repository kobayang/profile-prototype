class ProfileSkillToCounterCache < ActiveRecord::Migration[5.0]
  def change
    add_column :profile_skills, :evaluations_count, :integer, default: 0
  end
end
