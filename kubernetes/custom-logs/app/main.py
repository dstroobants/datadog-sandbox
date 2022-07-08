import logging

import json_log_formatter

from time import time,sleep

formatter = json_log_formatter.JSONFormatter()

json_handler = logging.FileHandler(filename='/logging-script/script.log')
json_handler.setFormatter(formatter)

logger = logging.getLogger('my_json')
logger.addHandler(json_handler)
logger.setLevel(logging.INFO)
while True:
    sleep(5 - time() % 5)
    logger.info('Test Logging Event', extra={
        'key1': 'value1',
        'rate': '180.01Mbps'
    })
