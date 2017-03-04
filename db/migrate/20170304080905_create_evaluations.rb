class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.integer :evaluated
      t.integer :evaluator

      t.timestamps
    end
    # プロフィールスキルと評価者(ユーザー)の組み合わせは一意でなければならない
    add_index :evaluations, :evaluated
    add_index :evaluations, :evaluator
    add_index :evaluations, [:evaluated, :evaluator], unique: true
  end
end
