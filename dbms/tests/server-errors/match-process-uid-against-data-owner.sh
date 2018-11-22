#!/usr/bin/env bash

if [ "$CLICKHOUSE_SERVER" == "" ]; then
    echo "This test is not supposed to be run by itself. Run dbms/tests/clickhouse-test-server instead."
    exit 1
fi

TEST_CONFIG="$CLICKHOUSE_CONFIG.$(basename $0)"


change_path() {
    local new_path="$1"
    cat $CLICKHOUSE_CONFIG | sed 's@<path>.*</path>@<path>'"$new_path"'</path>@' | \
        sed '/_port/d' > $TEST_CONFIG
}


test_error() {
    local log_message="$1"
    local test_error_message="$2"

    if $CLICKHOUSE_SERVER --config-file=$TEST_CONFIG --log $CLICKHOUSE_LOG; then
        echo "Test failed: expected that server will exit with an error"
        exit 1
    fi

    if ! grep --silent "$log_message" $CLICKHOUSE_LOG; then
        echo "Test failed: expected to find a message about $test_error_message"
        exit 1
    fi
}


change_path "$DATA_DIR/no_such_directory/"
test_error 'Failed to stat.*no_such_directory' 'failed stat call in the log'

USER="$(id --user --name)"
MESSAGE="Effective user of the process ($USER) does not match the owner of the data"

if [ "$(id --user)" == "0" ]; then
    OTHER_USER='nobody'
    NON_ROOT_DATA="$DATA_DIR/non_root_data"
    mkdir "$NON_ROOT_DATA"
    chown "$OTHER_USER" "$NON_ROOT_DATA"
    change_path "$NON_ROOT_DATA"
    MESSAGE="$MESSAGE ($OTHER_USER). Run under 'sudo -u $OTHER_USER'."
else
    change_path "/root/"
fi

test_error "$MESSAGE" 'mismatching users in the log'
