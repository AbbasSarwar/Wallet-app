class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = Group.all
  end

  def show
  end
end
