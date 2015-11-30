class Admin::BaseController < ActionController::Base
  include LoadSettings
  protect_from_forgery
  before_action :authenticate_admin_user!
  before_action :load_settings, only: %w(index)

  def index
    render '/admin/index', layout: 'admin'
  end

  def bootstrap_data
    render json: {}
  end
end
