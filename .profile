# Git prompt
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  export PS1="[\D{%l:%M%P} \u@`scutil --get ComputerName`:\w]\`__git_ps1\` \$ "
fi

# Git tab completion
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
fi

export VISUAL=pico
export EDITOR="$VISUAL"
