class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :question_id
      t.string :question_answer
    end
  end
end
