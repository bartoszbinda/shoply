# frozen_string_literal: true

class ManageusersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @user = current_user
  end

  def updateAdminStatus
    @user = User.find(params[:id])
    @user.isAdmin = !@user.isAdmin
    redirect_to manageusers_path if @user.save
  end

  def setIsBanned
    @user = User.find(params[:id])
    @user.isBanned = !@user.isBanned
    redirect_to manageusers_path if @user.save
  end
end
