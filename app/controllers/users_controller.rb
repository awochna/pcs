class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @characters = @user.characters unless @user.characters.empty?
    render
  end
end
