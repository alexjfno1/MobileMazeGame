window.MazeCanvas =
  canvas: document.getElementById("maze")

  context: ->
    @canvas.getContext "2d"

  width: ->
    @canvas.width

  height: ->
    @canvas.height

  expand: ->
    @canvas.width  = window.innerWidth
    @canvas.height = window.innerHeight

MazeCanvas.expand()
