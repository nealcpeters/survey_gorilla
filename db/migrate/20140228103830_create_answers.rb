class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :option_id
      t.integer :user_id
      t.integer :question_id
      t.integer :survey_id

      t.timestamps
    end
  end
end
