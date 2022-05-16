extends CanvasModulate

const NIGHT_COLOR = Color("#091d3a")
const DAY_COLOR = Color("#ffffff")
const TIME_SCALE = 0.0025

var time = 1

func _process(delta:float) -> void:
	self.time += delta * TIME_SCALE
	self.color = NIGHT_COLOR.linear_interpolate(DAY_COLOR, abs(sin(time)))
