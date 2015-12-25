@settingsConfig = ->
  config =
    menuIcon: 'cog'
    items:
      general: generalSettingsConfig()
      main_menu: new AntsMenu('Menu', '/admin/menus/main-menu')
      categories: new JournalCategories()
      admins: new AntsAdminUsers()
      redirects: new AntsRedirects()
      css: cssSettingsConfig()
      js: jsSettingsConfig()
