class GroupsController < ApplicationController
  before_action :authenticate_user!, :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @user = current_user
    if @user.isAdmin
      @groups = Group.all
    else
      @groups = @user.groups
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @user = current_user
    if params[:search]
      @users = User.search(params[:search])
    else
      @users = nil
    end
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
    @user = User.find(params[:user_id])
    @group.users << @user unless @group.users.include? @user
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
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
    params.permit(:name, :search,:id)
  end
end