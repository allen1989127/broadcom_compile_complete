#!/usr/bin/env bash

function _complete
{
    local DEVICES cur

    COMPREPLY=()
    _get_comp_words_by_ref cur

    case "${COMP_CWORD}" in
        1)
            DEVICES=`ls vendor/broadcom/tools/scripts/buildconfig/`
            COMPREPLY=( $( compgen -W "$DEVICES" -- "$cur") )
            ;;
        #2)
        #    local index FOLDER

        #    index=`expr index "${COMP_WORDS[COMP_CWORD]}" /`
        #    if [ $index -eq 0 ]
        #    then
        #        FOLDER=`ls`
        #    else
        #        FOLDER=`ls ${COMP_WORDS[COMP_CWORD]%/*}`
        #    fi
        #    COMPREPLY=( $( compgen -W "$FOLDER" -- "$cur" ) )
        #    ;;
        *)
            ;;
    esac
}

function mmm
{
    vendor/broadcom/tools/scripts/mmm.sh --variant $1 $2
}

function buildall
{
    vendor/broadcom/tools/scripts/brcm_buildall.sh --variant $1 $2
}

complete -f -F _complete mmm
