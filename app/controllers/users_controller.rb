class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @portfolios = @user.portfolios
  end

end
