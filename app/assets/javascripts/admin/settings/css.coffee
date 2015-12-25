@cssSettingsConfig = ->
  formSchema =
    css_editor_panel:
      type: "group"
      title: "CSS"
      groupClass: "group-panel"
      inputs:
        css:
          type: "css"

  new AntsSettings('Styles', 'styles', formSchema)
