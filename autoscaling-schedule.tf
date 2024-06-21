resource "aws_autoscaling_schedule" "turn_on_morning" {
  scheduled_action_name  = "turn_on_morning"
  min_size               = 1
  max_size               = 4
  desired_capacity       = 4
  start_time             = "2016-12-11T18:00:00Z"
  recurrence             = "0 9 * * MON-FRI" # https://crontab.guru/
  autoscaling_group_name = aws_autoscaling_group.autoscaling_ec2.name
}

resource "aws_autoscaling_schedule" "turn_off_evening" {
  scheduled_action_name  = "turn_off_evening"
  min_size               = 0
  max_size               = 0
  desired_capacity       = 0
  start_time             = "2016-12-11T18:00:00Z"
  recurrence             = "0 18 * * MON-FRI"
  autoscaling_group_name = aws_autoscaling_group.autoscaling_ec2.name
}