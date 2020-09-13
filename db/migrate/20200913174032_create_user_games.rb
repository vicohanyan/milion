class CreateUserGames < ActiveRecord::Migration[6.0]
  def change
    create_table :user_game do |t|
      t.integer :game_id
      t.integer :question_id
      t.integer :user_id
      t.integer :answer_id
    end
  end
end
