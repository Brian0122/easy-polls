class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer
      t.integer :question_id
      t.integer :check_count
      t.timestamps
    end
  end
end
