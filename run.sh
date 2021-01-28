#!/bin/bash

CIPHERTEXT="AQICAHi28bkvgXXoVErdFufB38p6vXFi9Nlih69yn2npPLmVfwEgoHeal049hTfZNleFMBYgAAAAajBoBgkqhkiG9w0BBwagWzBZAgEAMFQGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMcWZP5OQIafIXmeUOAgEQgCeeqXGxPkStKkWbjlor26OGtobS4oWs4Va80/83QKHKUG09KuBnvQE="
ENCLAVE_CID=$(nitro-cli describe-enclaves | jq -r .[0].EnclaveCID)


for i in {1..10000}; do
	#statements
	echo
	echo "<<<<<< $i >>>>>>"
	echo
	docker run --network host -it kmstool-instance /kmstool_instance --cid "$ENCLAVE_CID" "$CIPHERTEXT"
	sleep 1
	echo
	echo "================"
done

echo "done"
