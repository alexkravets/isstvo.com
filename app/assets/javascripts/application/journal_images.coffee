class @JournalImages
  constructor: (@imageSelector) ->
    max_width     = 1000
    max_height    = 800
    width_offset  = 80
    height_offset = 80

    window_width  = $(window).width()
    window_height = $(window).height()

    @max_width    = window_width  - width_offset  if window_width  - width_offset  < max_width
    @max_height   = window_height - height_offset if window_height - height_offset < max_height

    @_process_images()


  _process_images: ->
    $(@imageSelector).each (i, img) =>
      $img = $(img)

      @_attach_title($img)

      if $img.prop('complete')
        @_resize_image($img)
      else
        $img.load =>
          @_resize_image($img)


  _attach_title: ($img) ->
    title = $img.attr('alt')
    $img.wrap('<figure>')
    $img.after("<figcaption>#{ title }</figcaption>")


  _resize_image: ($img) ->
    if $img.height() > @max_height
      $img.css({ height: @max_height, width: 'auto' })
    else
      #$img.parent().parent().addClass('wide-paragraph')
