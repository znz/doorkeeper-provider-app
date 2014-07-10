class CustomApplicationsController < Doorkeeper::ApplicationsController
  before_filter :authenticate_user!
  # duplicated load but required to authorize
  load_and_authorize_resource class: 'Doorkeeper::Application'
end
