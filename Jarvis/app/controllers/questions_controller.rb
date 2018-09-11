class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index 
    @questions = Question.all 
  end  

  def show 
  end  

  def edit  
  end   

  def new 
    @question = Question.new
  end  

  def create 
    @question = Question.new(question_params)

    if @question.save 
      redirect_to questions_path notice: 'Question was successfully created.'
    end
  end   

  def destroy 
  end   

  private 

  def set_question 
    @question = Question.find(params[:id])
  end   

  def question_params
    params.require(:question).permit(:body, :user_id)
  end
end
