class UsersController < ApplicationController
  def index
  	@users = User.where.not(id: current_user)
  	# @user = User.where(id: current_user).first
  	# @other_users = Connection.where.not(user_id: @user).first
  	render 'users/index'
  end

  def show
  	@user = User.where(id: params[:id]).first
  	render 'users/show'
  end
end
