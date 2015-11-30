module LoadSettings
  extend ActiveSupport::Concern

  included do
    def load_settings
      @settings = SettingsObject.hash
      if @settings.empty?
        build_settings_defaults
        @settings = SettingsObject.hash
      end
    end

    def build_settings_defaults
      SettingsObject.create(title: 'general', values: {
        website_title: '',
        website_tagline: '',
        website_description: '',
        website_logo_url: '',
        website_url: '',
        sidebar_image_url: '',
        sidebar_tagline: ''
      })
    end

      # @site_url          = 'http://isstvo.com'
      # @site_name         = 'isstvo.com'
      # @site_title        = 'Stanislav Kravets'
      # @site_description  = 'Stanislav Kravets is a modern art painter from Kyiv, Ukraine.'
      # @header_image_url  = 'https://mir-s3-cdn-cf.behance.net/user/138/249984.53a559df62057.jpg'
      # @header_tagline    = "I'm <strong><a href='/'>Stanislav Kravets</a></strong>, a modern painter from<br/> Kyiv, Ukraine."
      # @site_og_image_url = @header_image_url
      # @disqus_shortname  = 'isstvo'

  end
end
