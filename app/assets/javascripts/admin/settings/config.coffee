@settingsConfig = ->
  config =
    menuIcon: 'cog'
    items:
      general: generalSettingsConfig()
      main_menu: new AntsMenu('Menu', '/admin/menus/main-menu')
      admins: new AntsAdminUsers()
      redirects: new AntsRedirects()
