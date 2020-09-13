class GameController < ActionController::Base
  def index
  end

  def start
    if params[:game_id].nil?
      @game_id = Game.find_by_sql('SELECT COALESCE(max(game_id) + 1,1) AS game_id FROM user_game')[0]['game_id']
    else
      @game_id = params[:game_id]
    end
    @question = Questions.find_by_sql("
      SELECT id,text
      FROM questions
      WHERE id NOT IN (SELECT question_id FROM user_game WHERE game_id = " + @game_id.to_s + " )
      ORDER BY RANDOM() LIMIT 1;")
    @answers = Answers.where(question_id: @question)
    if @answers.nil? || @question == []
      redirect_to :action => 'finish', :game_id => @game_id
    end
  end

  def set_answer
    if params[:set] == 'true'
      object = Game.new(:game_id => params[:game_id], :question_id => params[:question_id], :answer_id => params[:answer_id], :user_id => 1)
      object.save
    end
    @question = Questions.find_by_sql("SELECT id,text FROM questions WHERE id = " + params[:question_id] + " LIMIT 1;")
    @answers = Answers.where(question_id: params[:question_id])
    @right_answer = Answers.where(question_id: params[:question_id],is_true: 1)
    @selected_answer = params[:answer_id]
    render "right_answer", :game_id => params[:game_id]
  end

  def finish
    @score = Game.find_by_sql( "SELECT COALESCE(SUM(score),0) AS score FROM user_game
                                        LEFT  JOIN questions ON questions.id        = user_game.question_id
                                        INNER JOIN answers   ON answers.id          = user_game.answer_id AND answers.is_true = 1
                                        WHERE game_id = " + params[:game_id] + ";" )[0]['score']
    render "finish", :score => @score
  end

end

