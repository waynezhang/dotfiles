__conda_setup="$('~/.local/share/rtx/installs/python/anaconda3-2023.09-0/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "~/.local/share/rtx/installs/python/anaconda3-2023.09-0/etc/profile.d/conda.sh" ]; then
        . "~/.local/share/rtx/installs/python/anaconda3-2023.09-0/etc/profile.d/conda.sh"
    else
        export PATH="~/.local/share/rtx/installs/python/anaconda3-2023.09-0/bin:$PATH"
    fi
fi
unset __conda_setup
