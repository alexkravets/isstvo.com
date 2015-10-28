class @JournalVideos
  constructor: (@linkSelector) ->
    @_embed_youtube_videos()


  _embed_youtube_videos: ->
    $(@linkSelector).each (i, el) =>
      url = $(el).attr('href')
      if url.split('youtube.com/').length > 1
        $paragraph  = $(el).parent()
        youtube_id  = @_parse_youtube_id(url)
        @_embed_youtube_video($paragraph, youtube_id)


  _parse_youtube_id: (url) ->
    id_with_params = url.split('v=')[1]
    id             = id_with_params.split('&')[0]
    return id


  _embed_youtube_video: ($paragraph, youtube_id) ->
    # $paragraph.addClass 'wide-paragraph'
    width  = $paragraph.width()
    height = width * 480 / 860 # default youtube size
    url    = "//www.youtube.com/embed/#{ youtube_id }"
    $paragraph.html "<iframe width='#{ width }' height='#{ height }' src='#{ url }' frameborder='0' allowfullscreen></iframe>"