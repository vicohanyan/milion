class QuestionsController < ActionController::Base
    http_basic_authenticate_with name: "admin", password: "admin"
    def index
        @questions = Questions.all
    end

    def new
        @questions = Questions.new
    end

    def update
        @questions = Questions.find(params[:id])
        if @questions.update(questions_params)
            redirect_to @questions
        else
            render 'edit'
        end
    end

    def create
        @questions = Questions.new(questions_params)
        if @questions.save
            redirect_to @questions
        else
            render 'new'
        end
    end

    def edit
        @questions = Questions.find(params[:id])
    end

    def show
        @questions = Questions.find(params[:id])
        @answers = Answers.where(question_id: params[:id])
    end

    def destroy
        @questions = Questions.find(params[:id])
        @questions.destroy
        flash[:notice] = "question deleted"
        redirect_to action: "index"
    end

    private def questions_params
        params.require(:questions).permit(:text,:score)
    end
end

