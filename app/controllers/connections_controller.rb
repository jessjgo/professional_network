class ConnectionsController < ApplicationController
  def index
  	@user = User.where(id: session[:user_id]).first
  	@users = User.where.not(id: current_user)
  	render 'connections/index'
  end

  def create
  	@connect = Connection.new(user_id: params[:id])
  	redirect_to '/professional_profile'
  end

  def show
  end

  def destroy
  end
end