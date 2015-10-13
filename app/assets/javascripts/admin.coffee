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
      items:
        admins:    new AntsAdmins()
        redirects: new AntsRedirects()

  return { modules: all_modules }

$ ->
  $.get '/admin/bootstrap.json', (response) ->
    config = veniceConfig(response)

    chr.start('Venice', config)

    # append signout button to the end of sidebar menu
    $('a[data-method=delete]').appendTo(".sidebar .menu").show()