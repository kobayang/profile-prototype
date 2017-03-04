class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.integer :evaluated_id
      t.integer :evaluator_id

      t.timestamps
    end
    # プロフィールスキルと評価者(ユーザー)の組み合わせは一意でなければならない
    add_index :evaluations, :evaluated_id
    add_index :evaluations, :evaluator_id
    add_index :evaluations, [:evaluated_id, :evaluator_id], unique: true
  end
end
