# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :authenticate_user!, :set_group, only: %i[show edit update destroy]

  # GET /groups
  # GET /groups.json
  def index
    @user = current_user
    @groups = if @user.isAdmin
                Group.all
              else
                @user.groups
              end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @user = current_user
    @group = Group.find(params[:id])
    @users = (User.search(params[:search]) if params[:search])
    @userList = []
    User.all.each do |user|
      if @group.users.include? user
        @userList << user
      end
    end
    respond_to do |format|
      format.html
      format.csv { send_data @group.lists.to_csv}
      format.pdf do
        pdf = ReportPdf.new(@group)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end
  end

  def deliver_now
    @user = current_user
    @group = Group.find(params[:id])
    @group.users.each do |user|
      ListMailer.list_email_with_given_group(user, @group).deliver_now
    end
    redirect_to group_path(@group)
  end

  def search
    @users = User.search(params[:search])
    redirect_to @group
  end

  # GET /groups/new
  def new
    @group = Group.new
    @user = current_user
  end

  # GET /groups/1/edit
  def edit
    @user = current_user
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @user = current_user
    @group.created_by = @user.nick
    @group.users << @user
    respond_to do |format|
      if @group.save && @user.save
        @group.users.each do |user|
          ListMailer.list_email(user).deliver_now
        end
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    @group = Group.find(params[:id])
    if(!params[:user_id].nil?)
    @user = User.find(params[:user_id])
    @group.users << @user unless @group.users.include? @user
    end
    respond_to do |format|
      if @group.update(group_params_update)
        @group.users.each do |user|
          ListMailer.list_email(user).deliver_now
        end
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end
  def delete_user
    @user = current_user
    @group = Group.find(params[:id])
    @userToDelete = User.find(params[:user_id])
    @userToDelete.groups.delete(@group)
    @group.users.delete(@userToDelete)
    redirect_to group_path(@group)
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      @group.users.each do |user|
        ListMailer.list_email(user).deliver_now
      end
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.

  def group_params
    params.require(:group).permit(:name, :search,:id)
  end
  def group_params_update
    params.permit(:name, :search,:id)
  end
end
