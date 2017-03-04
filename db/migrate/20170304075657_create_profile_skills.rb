class CreateProfileSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_skills do |t|
      t.integer :profile_id
      t.integer :skill_id

      t.timestamps
    end
    # プロフィールとスキルの組み合わせは一意でなければならない
    add_index :profile_skills, :profile_id
    add_index :profile_skills, :skill_id
    add_index :profile_skills, [:profile_id, :skill_id], unique: true
  end
end
