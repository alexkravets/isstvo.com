class @GroupHeader
  constructor: (@form, @group, name) ->
    @$title  =$ "<span>#{ name }</span>"
    @$header =$ """<header class='group-header'></header>"""
    @$header.append @$title
    @group.$el.prepend @$header

@generalSettingsConfig = ->
  formSchema =
    website_settings:
      type: 'group'
      title: 'Website'
      groupClass: 'group-panel'
      inputs:
        website_title:
          type: 'string'
          label: 'Site Title'
          placeholder: 'Choose a short name for this site.'
        website_tagline:
          type: 'string'
          label: 'Site Tagline'
          placeholder: 'In a few words, explain what this site is about.'
        website_url:
          type: 'string'
          label: 'Site Address'
          placeholder: 'http://mysite.com'

    visibility_settings:
      type: 'group'
      title: 'Visibility'
      groupClass: 'group-panel'
      inputs:
        website_description:
          type: 'text'
          label: 'Site Description'
          placeholder: 'Write a short summary to advertise this site.'
        website_logo_url:
          type: 'loft-image'
          label: 'Site Logo'
          placeholder: 'Pick an image that represents your site.'

    sidebar_settings:
      type: 'group'
      title: 'Sidebar'
      groupClass: 'group-panel'
      inputs:
        sidebar_image_url:
          type: 'loft-image'
          label: 'Sidebar Image'
        sidebar_tagline:
          type: 'text'
          label: 'Sidebar Tagline'

    social_panel:
      type: 'group'
      title: 'Social'
      groupClass: 'group-panel'
      inputs:
        social_links:
          type: 'array'
          label: 'Links to Social Profiles'
          ignoreArrayWithEmptyString: true
          placeholder: 'Put a link to your social page (Facebook, Twitter, etc...)'

  new AntsSettings('General', 'general', formSchema)
