class Api::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy, :set_user]
  before_action :set_user, only: [:destroy]
  skip_before_action :verify_authentication, only: [:index]

  def index
    @questions = Question.all
  end

  def show
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created 
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user === @user
      @question.destroy
      render json: @question, status: :destroyed
    else
  
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def set_user
      btest = Question.find(params[:id]).user_id
      @user = User.find(btest)
    end

   
    def question_params
      params.require(:question).permit(:body, :user_id)
    end
end