#!/bin/bash

CACHE_DIR="$HOME/.cache/eww"

function lock() {
    touch "$CACHE_DIR/$1.lock"
}

function unlock() {
    rm "$CACHE_DIR/$1.lock"
}

function is_locked() {
    [ -f "$CACHE_DIR/$1.lock" ]
}

function get_easing() {
    case "$1" in
        "ease_out_quart") echo "1-((1-$2/100)^4)" | bc -l;;
        "ease_out_expo") [ "$2" = 100 ] && echo 100 || echo $(awk "BEGIN {print 1-(2^(-10*($2/100)))}");;
        *) echo "Unknown Easing Function" && exit 1;;
    esac
}

function run() {
    local id
    local scalar=1
    local ease="ease_out_quart"
    local follow=false

    while getopts ":i:e:s:f" arg; do
        case "$arg" in
            "i") id=$OPTARG;;
            "e") ease=$OPTARG;;
            "s") scalar=$OPTARG;;
            "f") follow=true;;
            \?) echo "Invalid option '$OPTARG'"
        esac
    done

    [ -z $id ] && echo "id is required" && exit 1

    lock "$id"

    for (( i=0; i<100; i+=2 ));do
        local val=$(get_easing $ease $i)
        echo "$scalar*$val" | bc -l
        sleep 0.01
    done
    echo $scalar

    unlock "$id"
}

if ! [ -d "$CACHE_DIR" ];then
    mkdir -p "$CACHE_DIR"
fi

case "$1" in
    "run") run "${@:2}";;
    "is_locked") is_locked "$2";;
    *) echo "Unknown command";;
esac

