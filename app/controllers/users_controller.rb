class UsersController < ApplicationController
  def index
    @users = User.all

  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save 
      redirect_to users_url, notice: "User #{@user.name} was successfully created"
    else
      render  action: "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_url, notice: "User #{@user.name} was successfully updated"
    else
      render action: "edit"
    end
  end

  def destroy
    User.destroy params[:id]
    redirect_to :back, :notice => 'User was successfully deleted'
  end

end

