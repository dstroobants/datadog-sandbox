resource "datadog_monitor" "cpumonitor" {
  name = "TF Managed CPU monitor"
  type = "metric alert"
  message = "CPU usage alert"
  query = "avg(last_1m):avg:system.cpu.system{*} by {host} > 60"
}