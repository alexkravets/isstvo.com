#= require jquery
#= require jquery_ujs

#= require_tree ./application

$ ->
  new JournalImages('.journal-page p > img')
  new JournalVideos('.journal-page p > a')
