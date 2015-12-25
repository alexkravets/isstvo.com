@jsSettingsConfig = ->
  formSchema =
    js_editor_panel:
      type: "group"
      title: "JavaScript"
      groupClass: "group-panel"
      inputs:
        javascript:
          type: "js"

  new AntsSettings('Scripts', 'scripts', formSchema)
