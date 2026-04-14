class CreateChats < ActiveRecord::Migration[8.1]
  def change
    create_table :chats do |t|
      t.references :user, null: false, foreign_key: true
      t.text :questionnaire_answers
      t.text :ai_output
      t.text :questions_prompt

      t.timestamps
    end
  end
end
