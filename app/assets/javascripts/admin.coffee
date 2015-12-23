#= require jquery
#= require jquery_ujs

#= require chr
#= require loft
#= require ants
#= require tape
#= require journal

#= require_tree ./admin

@redirectToSignIn = ->
  signinPath = "/admin/sign_in"
  if window.location.hash
    returnTo = window.location.hash.substring(1)
    signinPath = "#{signinPath}?return_to=#{returnTo}"
  window.location = signinPath

@addWebsiteLink = ->
  $link =$ """<a href='/' target='_blank'>
                <i class='fa fa-home fa-fw'></i> View Site
              </a>"""
  chr.$mainMenu.prepend $link

$ ->
  $.get("/admin/bootstrap.json", (response) ->
    chr.start 'Venice',
      modules:
        tape: new Tape('Reader')
        posts: new JournalPosts()
        pages: new JournalPages()
        loft: new Loft()
        settings: settingsConfig()

    new AntsProfile()
    addWebsiteLink()
  ).fail (response) ->
    if response.status == 401
      redirectToSignIn(response)
