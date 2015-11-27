#= require jquery
#= require jquery_ujs

#= require chr
#= require loft
#= require ants
#= require tape
#= require journal

@addWebsiteLink = ->
  $link =$ """<a href='/' target='_blank'>
                <i class='fa fa-home fa-fw'></i> View Site
              </a>"""
  chr.$mainMenu.prepend $link

@veniceConfig = (data) ->
  modules     = {}
  all_modules =
    tape: new Tape('Reader')
    posts: new JournalPosts()
    pages: new JournalPages()
    loft: new Loft()
    settings:
      menuIcon: 'cog'
      items:
        main_menu: new AntsMenu('Menu', '/admin/menus/main-menu')
        admins: new AntsAdminUsers()
        redirects: new AntsRedirects()

  return { modules: all_modules }

$ ->
  $.get '/admin/bootstrap.json', (response) ->
    config = veniceConfig(response)

    chr.start('Venice', config)
    new AntsProfile()
    addWebsiteLink()
