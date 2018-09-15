class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  

  def new 
    redirect_to questions_path, notice: 'You must be logged in to answer' if !(current_user)
    @answer = Answer.new 
  end 
  
  def create 
    @answer = Answer.new(answer_params) 

    if @answer.save
      redirect_to @answer.question, notice: 'Answer was successfully posted.'
    else
      render :new 
    end
  end

  def edit 
    redirect_to questions_path
  end  

  def update 

    if @answer.update(comment_params)
      redirect_to questions_path, notice: 'Answer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy 
    post = @answer.question
    @answer.destroy
    redirect_to questions_path, notice: 'Answer was successfully destructed.' 
  end   


private 

def set_answer
  @answer = Answer.find(params[:id])
end

def answer_params
  params.permit(:question_id, :user_id, :body)
end

end
