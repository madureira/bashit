#!/bin/bash

# #
# Bashit is a custom script used to config your ~/.bashrc
# #
main() {
    intro
    config_bashrc
    add_aliases
    source_bashrc
    finish
}

function intro() {
    echo -e "+---------------------------+"
    echo -e "|                           |"
    echo -e "|      Bashit installer     |"
    echo -e "|                           |"
    echo -e "+---------------------------+"
    echo -e "\n"

    sleep 2
}

function config_bashrc() {
    log "wait" "Let's config your ~/.bashrc"
    sleep 3
    {
        cat ./settings/bash_formatter.sh >> ~/.bashrc
    } && {
        log "success" "Done!\n"
    } || {
        log "error" "Some problem has occurred :(\n"
    }
}

function add_aliases() {
    log "wait" "Wait a second when we add some alias for you"
    sleep 3
    {
        cat ./settings/aliases.sh >> ~/.bashrc
    } && {
        log "success" "Done!\n"
    } || {
        log "error" "Some problem has occurred :(\n"
    }
}

function source_bashrc() {
    log "wait" "Updating your ~/.bashrc"
    sleep 3
    {
        source ~/.bashrc
    } && {
        log "success" "Done!\n"
    } || {
        log "error" "Some problem has occurred :(\n"
    }
}

function finish() {
    log "success" "So, I have done my job here!. I see you in your next computer :)\n"
    bash
}

function log() {
    info="info"
    warning="warning"
    success="success"
    error="error"
    wait="wait"
    exec="exec"

    white="\e[1;37m"
    yellow="\e[93m"
    green="\e[1;32m"
    red="\e[31m"

    emoji_coffee="☕"
    emogi_warn="⚠"
    emoji_ok="✓"
    emoji_err="✗"
    emoji_time="⌛"

    local type=$1
    local msg=$2

    if [ "$type" == "$info" ]; then
        printf "`echo "$white   $2"`\n";
    fi

    if [ "$type" == "$warning" ]; then
        printf "`echo "$yellow $emogi_warn $2"`\n";
    fi

    if [ "$type" == "$success" ]; then
        printf "`echo "$green $emoji_ok $2"`\n";
    fi

    if [ "$type" == "$error" ]; then
        printf "`echo "$red $emoji_err $2"`\n";
    fi

    if [ "$type" == "$wait" ]; then
        printf "`echo "$emoji_coffee $white $2"`\n";
    fi

    if [ "$type" == "$exec" ]; then
        printf "`echo "$emoji_time $white $2"`\n";
    fi
}


main "$@"
