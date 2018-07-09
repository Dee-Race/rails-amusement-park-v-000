class SessionsController < ApplicationController

  def sign_in
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user_id])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'signin'
    end
  end


end
