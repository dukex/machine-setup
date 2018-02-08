_git_repo_name() {
    gittopdir=$(git rev-parse --git-dir 2> /dev/null)
    if [[ "foo$gittopdir" == "foo.git" ]]; then
        echo `basename $(pwd)`
    elif [[ "foo$gittopdir" != "foo" ]]; then
        echo `dirname $gittopdir | xargs basename`
    fi
}
_git_branch_name() {
    git branch 2>/dev/null | awk '/^\*/ { print $2 }'
}

_git_is_dirty() {
   git diff --quiet 2> /dev/null || echo '*'
}

autoload -U colors
colors

setopt prompt_subst

# RPROMPT='$(_git_repo_name) $(_git_branch_name) $(_git_is_dirty)'
RPROMPT='$(_git_is_dirty) $(_git_repo_name) $(_git_branch_name)'
