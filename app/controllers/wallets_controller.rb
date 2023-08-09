class WalletsController < ApplicationController
    def show
    end
    def new
        @current_user = current_user
        @group = @current_user.groups.find_by_id(params[:group_id])
        @wallet = @group.wallets.new
    end
    def create
        @current_user = current_user
        @wallet_create = @current_user.wallets.build(wallet_params)
        if @wallet_create.save
            @group_wallets = GroupWallet.create(group_id: params[:group_id], wallet_id: @wallet_create.id)
            redirect_to "/users/#{current_user.id}/groups/"

            flash[:notice] = "successful"
        else
            flash[:alert] = "Error"
        end

    end

    private
    def wallet_params
        params.require(:wallet).permit(:name, :amount)
    end
end
