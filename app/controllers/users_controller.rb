class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create, :show]

  before_action :require_correct_user
  skip_before_action :require_correct_user,
                     only: [:new, :create, :show, :index, :destroy]

  before_action :require_admin_user
  skip_before_action :require_admin_user,
                     only: [:new, :show, :create, :edit, :update, :index]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def require_login
    unless logged_in?
      store_forwarding_url
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def require_correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to(root_url)
    end
  end

  def require_admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
