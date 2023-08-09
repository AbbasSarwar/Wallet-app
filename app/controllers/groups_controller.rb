class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = current_user.groups.includes(:wallets)
    @total_amount = 0
    @items.each do |item|
      @total_amount += item.wallets.sum(:amount)
    end
  end

  def show
    @current_user = current_user
    @group = @current_user.groups.find(params[:id])
    @wallets = @group.wallets
    # @wallet = @wallets.find(params[:id])
  end

  def new 
    @current_user = current_user
    @group = Group.new
  end
  def create
    @createGroup = current_user.groups.build(group_params)
    if @createGroup.save
      flash[:notice] = "Successful Added"
      redirect_to user_groups_path(current_user)
    else
      flash[:alert] = "failed to Add"
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
