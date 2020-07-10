class UsersController < ApplicationController
  before_action :require_signed_in!, only: [:show, :edit, :update, :index, :portfolio]

  def index 
    @users = User.all
  end

  def show
    @user = current_user
    render :show
  end

  def edit
    render :edit
  end

  def update
    if params[:user][:account_balance]
      current_user.update_account(current_user, params[:user][:account_balance])
    else
      current_user.update(user_params)
    end

    if current_user.save!
      redirect_to current_user
      flash[:notice] = "Deposit Successful"
    else
      flash.now[:errors] = current_user.errors.full_messages
      render :edit
    end
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    sign_in!(@user) 
    if @user.save
      redirect_to @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def portfolio
    @user = current_user
    @user.check_stocks
    render :portfolio
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :account_balance)
  end

  def set_user
    @user = current_user
  end
end