extends Node2D

var PlayerScore = 0
var OpponentScore = 0

func _on_left_body_entered(body):
	if body == $Ball:
		OpponentScore += 1
		$OpponentScoreSound.play()
		score_achieved()

func _on_right_body_entered(body):
	if body == $Ball:
		PlayerScore += 1
		$PlayerScoreSound.play()
		score_achieved()

func _process(_delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.clear()
	$OpponentScore.add_text(str(OpponentScore))
	$CountdownTimerLabel.text = str(int($CountdownTimer.time_left) + 1) #pero el timer sigue siendo 2s

func _on_countdown_timer_timeout():
	get_tree().call_group('BallGroup','restart_ball')
	$CountdownTimerLabel.visible = false

func score_achieved():
		get_tree().call_group('BallGroup', 'stop_ball')
		$Ball.position = Vector2(640,360)
		$CountdownTimer.start()
		$CountdownTimerLabel.visible = true
		$Player._ready()
		$Opponent._ready()
