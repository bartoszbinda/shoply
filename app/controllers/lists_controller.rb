class ListsController < ApplicationController

  # POST /lists
  # POST /lists.json
  def create
    @group = Group.find(params[:group_id])
    @user = current_user
    @list = @group.lists.create(list_params)
    redirect_to group_path(@group)
  end
  def edit
    @user = current_user
    @group = Group.find(params[:group_id])
    @list = @group.lists.find(params[:list_id])
  end

  def update
    @user = current_user
    @group = Group.find(params[:group_id])
    @user = current_user
    @list = @group.lists.find(params[:list_id])
    if @list.update(list_params_update)
      redirect_to @group
    else
      render 'edit'
    end
  end
  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @user = current_user
    @group = Group.find(params[:group_id])
    @list = @group.lists.find(params[:id])
    if @list.destroy
      redirect_to groups_path
    else
      render 'edit'
    end

    end
  def show
    @group = Group.find(params[:group_id])
    @user = current_user
    @list = @group.lists.find(params[:id])
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
  def list_params
    params.require(:list).permit(:title,:body,:group_id, :list )
  end
  def list_params_update
    params.permit(:title,:body,:group_id,:list)
  end
end
