class Admin::BaseController < ActionController::Base
  protect_from_forgery

  before_action :authenticate_admin_user!
  before_filter :settings

  def index
    render '/admin/index', layout: 'admin'
  end

  def bootstrap_data
    render json: {}
  end

  private
    def settings
      @site_name = 'isstvo.com'
    end
end
