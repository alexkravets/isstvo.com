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

    author_settings:
      type: 'group'
      title: 'Author'
      groupClass: 'group-panel'
      inputs:
        website_description:
          type: 'text'
          label: 'About'
          placeholder: 'Write a short bio about website author.'
        website_logo_url:
          type: 'loft-image'
          fullsizePreview: true

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
