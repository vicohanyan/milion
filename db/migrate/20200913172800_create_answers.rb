class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :is_true
      t.text    :text
    end
    add_foreign_key :answers, :questions
    execute "INSERT INTO answers (id,question_id,is_true,text)
                VALUES (1,1,1,'answer 1.0'),
                        (2,1,0,'answer 1.1'),
                        (3,1,0,'answer 1.2'),
                        (4,1,0,'answer 1.3'),
                        (5,1,0,'answer 1.4'),
                        (6,2,1,'answer 2.0'),
                        (7,2,0,'answer 2.1'),
                        (8,3,1,'answer 3.0'),
                        (9,3,0,'answer 3.1'),
                        (10,3,0,'answer 3.2'),
                        (11,3,0,'answer 3.3'),
                        (12,4,1,'answer 4.0'),
                        (13,4,0,'answer 4.1'),
                        (14,4,0,'answer 4.2'),
                        (15,4,0,'answer 4.3'),
                        (16,5,1,'answer 5.0'),
                        (17,5,0,'answer 5.1'),
                        (18,5,0,'answer 5.2'),
                        (28,2,1,'answer 2.3')
                "
  end
end
