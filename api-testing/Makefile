#!make
include ../.env
export

validate:
	curl -X GET "https://api.datadoghq.com/api/v1/validate" \
		-H "Content-Type: application/json" \
		-H "DD-API-KEY: ${DD_API_KEY}"

monitor-mute:
	curl -X POST "https://api.datadoghq.com/api/v1/monitor/76896004/mute" \
		-H "Content-Type: application/json" \
		-H "DD-API-KEY: ${DD_API_KEY}" \
		-H "DD-APPLICATION-KEY: ${DD_APP_KEY_MONITOR}"

synthetics-list:
	curl -X POST "https://api.datadoghq.com/api/v1/synthetics/tests" \
		-H "Content-Type: application/json" \
		-H "DD-API-KEY: ${DD_API_KEY}" \
		-H "DD-APPLICATION-KEY: ${DD_APP_KEY_MONITOR}"

dashboards_read:
	curl -X GET "https://api.datadoghq.com/api/v1/dashboard" \
	-H "Content-Type: application/json" \
	-H "DD-API-KEY: ${DD_API_KEY}" \
	-H "DD-APPLICATION-KEY: ${DD_APP_KEY_MONITOR}"
