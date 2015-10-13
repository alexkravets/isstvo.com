class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :settings

  private
    def settings
      @site_url          = 'http://www.isstvo.com'
      @site_name         = 'isstvo.com'
      @site_title        = 'Stanislav Kravets'
      @site_description  = 'Stanislav Kravets is a modern art painter from Kyiv, Ukraine.'

      @header_image_url  = 'https://mir-s3-cdn-cf.behance.net/user/138/249984.53a559df62057.jpg'
      @header_tagline    = "I'm <strong><a href='/'>Stanislav Kravets</a></strong>, a modern painter from<br/> Kyiv, Ukraine."

      @site_og_image_url = @header_image_url

      @disqus_shortname  = 'isstvo'
    end
end
