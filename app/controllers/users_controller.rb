class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new
  	if @user.save 
  		redirect_to root_url, :notice => "Account Created!"
  	else
  		render :new
  	end
  end
end