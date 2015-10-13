#= require jquery
#= require jquery_ujs

#= require_tree ./application

$ ->
  new JournalMeta()
  new JournalImages('.journal-page p > img')
  new JournalVideos('.journal-page p > a')