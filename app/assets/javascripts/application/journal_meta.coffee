#= require vendor/moment

class @JournalMeta
  constructor: ->
    @today    = new Date()
    @tzOffset = @today.getTimezoneOffset() * -1

    @_set_published_at()


  _set_published_at: ->
    $('.journal-page-published-at').each (i, el) =>
      published_at = $(el).data 'published-at'
      m = moment(published_at).utcOffset(@tzOffset)
      format = @_smart_datetime_format(m)
      published_at = m.format(format)
      $(el).html(published_at)


  _smart_datetime_format: (momentObject) ->
    if @today.getFullYear() == momentObject.year()
      return 'MMM D hh:mm'

    return 'MMM D, YYYY hh:mm'