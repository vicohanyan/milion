class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :text
      t.integer :score
    end
    execute "INSERT INTO questions (id,text,score)
                VALUES (3,'question 3',10),
                        (5,'question 5',20),
                        (4,'question 4',15),
                        (1,'question 1',6),
                        (2,'question 2',5)
                "
  end
end
