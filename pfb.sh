#!/bin/bash

NAMESPACE_ID=${1:-0bd67d4ca8d729ff}
DATA=${2:-48656c6c6f2043656c657374696120576f726c642021}

curl -X POST -d '{"namespace_id": "'$NAMESPACE_ID'",
"data":"'$DATA'",
"gas_limit": 80000, "fee": 3000}' http://localhost:26659/submit_pfb