window.Obstructions =
  context: MazeCanvas.context()
  onePercentOfCanvasWidth: MazeCanvas.width() / 100
  onePercentOfCanvasHeight: MazeCanvas.height() / 100
  finalLevel: 3
  levels: {
      1: [],
      2: [
        {x:20, y:20, width:2, height:60},
        {x:20, y:80, width:40, height:2}
      ],
      3: [
        {x:20, y:20, width:2, height:60},
        {x:20, y:80, width:40, height:2},
        {x:58, y:20, width:2, height:60}
      ]
    }

  draw: (level)->
    obstructions = @levels[level]
    if (obstructions.length > 0)
      obstructions.forEach (ob) =>
        @context.beginPath()
        @context.rect(@onePercentOfCanvasWidth * ob.x, @onePercentOfCanvasHeight * ob.y, @onePercentOfCanvasWidth * ob.width, @onePercentOfCanvasHeight * ob.height)
        @context.fillStyle = "#123456"
        @context.fill()

  hit: (level) ->
    hit = false
    obstructions = @levels[level]
    if (obstructions.length > 0)
      obstructions.forEach (ob) =>
        if Ball.hasHit(@onePercentOfCanvasWidth * ob.x, @onePercentOfCanvasHeight * ob.y, @onePercentOfCanvasWidth * ob.width, @onePercentOfCanvasHeight * ob.height) then hit = true
    return hit
