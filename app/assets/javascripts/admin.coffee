#= require jquery
#= require jquery_ujs

#= require chr
#= require loft
#= require ants
#= require tape
#= require journal

@veniceConfig = (data) ->
  modules     = {}
  all_modules =
    tape:    new Tape()
    journal: new JournalPosts()
    pages:   new JournalPages()
    loft:    new Loft()
    settings:
      menuIcon: 'cog'
      items:
        main_menu: new AntsMenu('Menu', '/admin/menus/main-menu')
        admins:    new AntsAdminUsers()
        redirects: new AntsRedirects()

  return { modules: all_modules }

$ ->
  $.get '/admin/bootstrap.json', (response) ->
    config = veniceConfig(response)

    chr.start('Venice', config)
    new AntsProfile()
