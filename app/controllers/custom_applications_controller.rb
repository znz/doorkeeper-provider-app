class CustomApplicationsController < Doorkeeper::ApplicationsController
  before_filter :authenticate_user!
  # duplicated load but required to authorize
  load_and_authorize_resource class: 'Doorkeeper::Application'

  private def resource_params
    params.require(:doorkeeper_application).permit(:name, :redirect_uri, :scopes)
  end
end
