extends Area2D



func _on_SpikeTop_body_entered(body):
	#if body.name == "Player" or body is KinematicBody2D:
	# dont need this because we can use collision layers in Inspector 
	if body.has_method("hurt"):
		body.hurt()
	
