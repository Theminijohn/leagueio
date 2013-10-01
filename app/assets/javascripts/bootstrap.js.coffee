jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

  $("[data-toggle=\"checkbox\"]").each ->
  $(':checkbox').checkbox('uncheck');
