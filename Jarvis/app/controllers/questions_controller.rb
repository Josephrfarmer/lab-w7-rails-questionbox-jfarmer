class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index 
    @questions = Question.all 
  end  

  def show
    #instance var. with answers I need  
    @answers = @question.answers 
  end  

  def edit 
    redirect_to questions_path, notice: 'You must be logged in to edit a post' if !(current_user) 
  end   

  def new 
    redirect_to questions_path, notice: 'You must be logged in to add a new post' if !(current_user)
    @question = Question.new
  end  

  def create 
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save 
        format.html {redirect_to questions_path, notice: 'Question was successfully created.'}
      else
        format.html { render :new }
      end
    end
  end   

  def destroy 
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_path, notice: 'Question was successfully deleted.' }
    end
  end   

  private 

  def set_question 
    @question = Question.find(params[:id])
  end   

  def question_params
    params.require(:question).permit(:body, :user_id)
  end
end
