class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save 
      auto_login(@user)
  		redirect_to root_url, :notice => "Account Created!"
  	else
  		render :new
  	end
  end
end