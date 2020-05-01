#!/bin/bash
curl -m 1 https://google.com1 -I >/dev/null 2>&1
[ $? -gt 0 ] && echo "FAIL | color=red" || echo "OK | color=green"
echo "---"
echo "Show Graphs | color=#123def href=http://example.com/graph?foo=bar"
echo "Show KPI Report | color=purple href=http://example.com/report"