module Api::V1
  class MicropostsController < ApiController
    before_action -> { doorkeeper_authorize! :public }, only: [:index, :show]
    before_action only: [:create, :update] do
      doorkeeper_authorize! :admin, :write
    end
    respond_to :json

    # avoid "Can't verify CSRF token authenticity"
    skip_before_action :verify_authenticity_token

    def index
      @microposts = Micropost.all
      respond_with @microposts
    end

    def create
      micropost = Micropost.new(micropost_params)
      micropost.user = current_resource_owner
      micropost.save!
      respond_with micropost
    end

    private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
  end
end
