class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.signup(@user).deliver_now
      redirect_to questions_path, notice: 'Your account has been created, please log in.'
    else
      render new_user_path
    end
  end

  private
  

    def user_params
      params.require(:user).permit(:name, :username, :password, :email)
    end
end
