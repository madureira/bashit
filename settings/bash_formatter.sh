
# Bashit - Colors for Shell and Git
function git_color {
    local git_status="$(git status 2> /dev/null)"

    if [[ ! $git_status =~ "working directory clean" ]]; then
        echo -e $COLOR_RED;
    elif [[ $git_status =~ "Your branch is ahead of" ]]; then
        echo -e $COLOR_YELLOW;
    elif [[ $git_status =~ "nothing to commit" ]]; then
        echo -e $COLOR_GREEN;
    else
        echo -e $COLOR_OCHRE;
    fi
}

function git_branch {
    local git_status="$(git status 2> /dev/null)"
    local on_branch="On branch ([^${IFS}]*)"
    local on_commit="HEAD detached at ([^${IFS}]*)"

    if [[ $git_status =~ $on_branch ]]; then
        local branch=${BASH_REMATCH[1]}
        echo "($branch) ";
    elif [[ $git_status =~ $on_commit ]]; then
        local commit=${BASH_REMATCH[1]}
        echo "($commit) ";
    fi
}

export PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] $(git_color)$(git_branch)\[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
