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
      SettingsObject.create(title: "general", values: {
        website_title: "",
        website_tagline: "",
        website_description: "",
        website_logo_url: "",
        website_url: ""
      })
      SettingsObject.create(title: "styles", values: {
        css: ""
      })
      SettingsObject.create(title: "scripts", values: {
        javascript: ""
      })
    end
  end
end
