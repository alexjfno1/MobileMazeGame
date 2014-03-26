window.Obstructions =
  context: MazeCanvas.context()
  levels: {
    1: [],
    2: [{x: 100, y:100, width:50, height:50}]
  }

  draw: (level)->
    obstructions = @levels[level]
    if (obstructions.length > 0)
      obstructions.forEach (obstruction) =>
        @context.beginPath()
        @context.rect(obstruction.x, obstruction.y, obstruction.width, obstruction.height)
        @context.fillStyle = "red"
        @context.fill()
