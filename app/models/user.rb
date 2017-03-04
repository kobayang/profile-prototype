class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy

  has_many :evaluations, foreign_key: "evaluator_id", dependent: :delete_all
  has_many :eval_skills, through: :evaluations, source: :evaluated
end
