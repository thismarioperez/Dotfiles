# fzf custom functions
# File navigation
# @see http://ix.io/2hgn
fzcd() {
    cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && echo "$PWD"
}
# Git
# Search through all available branches and check out selected
fzgco() {
    git checkout “$(git branch — all | fzf | tr -d ‘[:space:]’)”
}

# Homebrew
# @see https://medium.com/better-programming/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d#e100
# Install (one or multiple) selected application(s)
# using "brew search" as source input
fzbi() {
    local inst=$(brew search | fzf -m --preview="brew info {}" --bind="space:toggle-preview" --preview-window=:hidden)

    if [[ $inst ]]; then
        for prog in $(echo $inst);
        do; brew install $prog; done;
    fi
}
# Update (one or multiple) selected application(s)
fzbu() {
    local upd=$(brew leaves | fzf -m --preview="brew info {}" --bind="space:toggle-preview" --preview-window=:hidden)

    if [[ $upd ]]; then
        for prog in $(echo $upd);
        do; brew upgrade $prog; done;
    fi
}
# Delete (one or multiple) selected application(s)
# mnemonic [B]rew [C]lean [P]ackage (e.g. uninstall)
fzbrm() {
    local uninst=$(brew leaves | fzf -m --preview="brew info {}" --bind="space:toggle-preview" --preview-window=:hidden)

    if [[ $uninst ]]; then
        for prog in $(echo $uninst);
        do; brew uninstall $prog; done;
    fi
}
