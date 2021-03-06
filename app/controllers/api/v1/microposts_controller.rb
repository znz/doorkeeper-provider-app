module Api::V1
  class MicropostsController < ApiController
    before_action -> { doorkeeper_authorize! :public }, only: [:index, :show]
    before_action only: [:create, :update] do
      doorkeeper_authorize! :admin, :write
    end

    # avoid "Can't verify CSRF token authenticity"
    skip_before_action :verify_authenticity_token

    def index
      @microposts = Micropost.all
      render json: @microposts
    end

    def create
      micropost = Micropost.new(micropost_params)
      micropost.user = current_resource_owner
      micropost.save!
      render json: micropost, status: 201
    end

    private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
  end
end
