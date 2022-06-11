extends ParallaxLayer

export(float) var CLOUD_SPEED = -30

func _process(delta):
	motion_offset.x += CLOUD_SPEED * delta
