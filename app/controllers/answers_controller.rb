class AnswersController < ApplicationController
    # before_action :authenticate_user!, except: [:index, :show]
    http_basic_authenticate_with name: "admin", password: "admin"



    def update
        @answers = Answers.find(params[:id])
        if @answers.update(answers_params)
            redirect_to :controller => :questions ,:action => :show, :id => @answers.question_id
        else
            render 'edit'
        end
    end

    def new
        @answers = Answers.new
    end

    def create
        @answers = Answers.create(answers_params)
        if @answers.save
            redirect_to :controller => :questions ,:action => :show, :id => @answers.question_id
        else
            render 'new'
        end
    end


    def edit
        @answers = Answers.find(params[:id])
    end

    def destroy
        @answers = Answers.find(params[:id])
        @answers.destroy
        redirect_to :controller => :questions ,:action => :show, :id => @answers.question_id
    end

    private def answers_params
        params.require(:answers).permit(:text,:is_true,:question_id)
    end
end

