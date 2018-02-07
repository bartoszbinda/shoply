class ListsController < ApplicationController

  # POST /lists
  # POST /lists.json
  def create
    @group = Group.find(params[:group_id])
    @user = current_user
    @list = @group.lists.create(list_params)
    @group.users.each do |user|
      ListMailer.list_email(user).deliver_now
    end
    redirect_to group_path(@group)
  end
  def edit
    @user = current_user
    @group = Group.find(params[:group_id])
    @list = @group.lists.find(params[:id])
  end

  def update
    @user = current_user
    @group = Group.find(params[:group_id])
    @user = current_user
    @list = @group.lists.find(params[:id])
    if @list.update(list_params_update)
      @group.users.each do |user|
        ListMailer.list_email(user).deliver_now
      end
      redirect_to groups_path
    else
      render 'edit'
    end
  end
  def toogle_status
    @user = current_user
    @group = Group.find(params[:group_id])
    @list = List.find(params[:id])
    @list.status = false
    @list.save
    redirect_to @group
  end
  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @user = current_user
    @group = Group.find(params[:group_id])
    @list = @group.lists.find(params[:id])
    if @list.status == true
      flash[:error] = "This item was already bought!"
    else
      @list.status = true
      @list.save
    end
    redirect_to @group

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
    params.require(:list).permit(:name,:amount,:body,:status,:group_id, :list )
  end
  def list_params_update
    params.permit(:body,:list, :name, :amount, :body, :status)
  end
end
