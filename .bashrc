alias cls='echo -e "\ec\e[3J"'

if [ -f C:/git-completion.bash ]; then
    . C:/git-completion.bash
fi

if [ -f C:/maven_bash_completion.bash ]; then
    . C:/maven_bash_completion.bash
fi

alias npm-pack-info='tarball="$(npm pack .)"; wc -c "${tarball}"; tar tvf "${tarball}"; rm "${tarball}";'
