class SessionsController < ApplicationController
  before_action :require_signed_in!, except: [:new, :create]

  def new
    render :new
  end

  def create 
    @user = User.find_by_credentials(
      params[:username],
      params[:password]
    )

    if @user
      sign_in!(@user)
      redirect_to @user
    else
      flash.now[:errors] = ['Invalid username or password']
      render :new
    end
  end

  def logout 
    sign_out!
    redirect_to root_path
  end



end
