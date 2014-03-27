window.Obstructions =
  context: MazeCanvas.context()
  finalLevel: 2
  levels: {
    1: [],
    2: [{x: 100, y:100, width:50, height:50}, {x: 250, y:300, width:50, height:50}]
  }

  draw: (level)->
    obstructions = @levels[level]
    if (obstructions.length > 0)
      obstructions.forEach (obstruction) =>
        @context.beginPath()
        @context.rect(obstruction.x, obstruction.y, obstruction.width, obstruction.height)
        @context.fillStyle = "red"
        @context.fill()

  hit: (level) ->
    hit = false
    obstructions = @levels[level]
    if (obstructions.length > 0)
      obstructions.forEach (ob) ->
        if Ball.hasHit(ob.x, ob.y, ob.width, ob.height) then hit = true
    return hit
