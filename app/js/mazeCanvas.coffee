window.MazeCanvas =
  canvas: document.getElementById("maze")

  context: ->
    @canvas.getContext "2d"

  width: ->
    @canvas.width

  height: ->
    @canvas.height

  expand: ->
    @canvas.width = window.innerWidth
    @adjustSize()

  adjustSize: ->
    if (@canvas.width * 1.3) > window.innerHeight
      @canvas.width -= 10
      @adjustSize()
    @canvas.height = @canvas.width * 1.3

MazeCanvas.expand()
