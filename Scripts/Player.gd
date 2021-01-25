extends KinematicBody2D

export(int) var speed
export(int) var sprint_speed = 300
export(int) var normal_speed = 200
var velocity := Vector2.ZERO
var direction := Vector2.ZERO
var stamina := 1200
var timer: float

func Movimentation():
	direction.x = (Input.get_action_strength("right") - Input.get_action_strength("left") )
	direction.y = (Input.get_action_strength("down") - Input.get_action_strength("up") )
	velocity = direction * speed
	
	move_and_slide(velocity)

func animation():
	match direction:
		Vector2.RIGHT:
			$AnimatedSprite.play("right_walking")
		Vector2.LEFT:
			$AnimatedSprite.play("left_walking")
		Vector2.UP:
			$AnimatedSprite.play("up_walking")
		Vector2.DOWN:
			$AnimatedSprite.play("down_walking")
			
	
	if direction == Vector2.ZERO:
		match $AnimatedSprite.animation:
			"down_walking":
				$AnimatedSprite.play("down_stopped")
			"up_walking":
				$AnimatedSprite.play("up_stopped")
			"left_walking":
				$AnimatedSprite.play("left_stopped")
			"right_walking":
				$AnimatedSprite.play("right_stopped")

func _process(delta):
	animation()

func _physics_process(delta):
	
	Movimentation()
	
	#Sistema de estamina
	if Input.is_action_pressed("Sprint") and velocity != Vector2.ZERO:
		speed = sprint_speed
		stamina -= 190 * delta
	else:
		speed = normal_speed

	if stamina <= 0:
		timer += delta
		speed = normal_speed

	if timer >= 6:
		stamina = 1200
		timer = 0


