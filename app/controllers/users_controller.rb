class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "登録しました!"
    else
      render :new
    end
  end
  def show
    @user = current_user
  end
  def destroy
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirm)
  end
end
