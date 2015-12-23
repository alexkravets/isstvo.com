module Admin
  class BaseController < ActionController::Base
    include LoadSettings

    protect_from_forgery
    before_action :authenticate_admin_user!, except: %w(index)
    before_action :load_settings, only: %w(index)

    def index
      render '/admin/index', layout: 'admin'
    end

    def bootstrap_data
      render json: {}
    end
  end
end
