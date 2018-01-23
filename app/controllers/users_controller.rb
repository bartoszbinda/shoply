# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to manageusers_path, notice: 'User deleted.' if @user.destroy
   end
end
