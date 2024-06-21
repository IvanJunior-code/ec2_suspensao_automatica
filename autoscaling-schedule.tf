resource "aws_autoscaling_schedule" "turn_on_morning" {
  scheduled_action_name  = "turn_on_morning"
  min_size               = 1
  max_size               = 4
  desired_capacity       = 4
  start_time             = timeadd(timestamp(), "10m")
  recurrence             = "0 12 * * MON-FRI" # https://crontab.guru/ o cron trabalha com o horário +0
  autoscaling_group_name = aws_autoscaling_group.autoscaling_ec2.name
}

resource "aws_autoscaling_schedule" "turn_off_evening" {
  scheduled_action_name  = "turn_off_evening"
  min_size               = 0
  max_size               = 0
  desired_capacity       = 0
  start_time             = timeadd(timestamp(), "11m") # 1min de diferença do outro agendamento, por regra da AWS
  recurrence             = "0 21 * * MON-FRI"
  autoscaling_group_name = aws_autoscaling_group.autoscaling_ec2.name
}