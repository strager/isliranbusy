#!/bin/sh

DIR="$(cd "$(dirname "$0")" && pwd)"

"$DIR/x-idle" 300000 || curl -q -X POST 'http://isliranbusy.com/ping.php'
