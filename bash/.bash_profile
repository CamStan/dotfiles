for file in ~/.config/bash/.{bash_prompt,exports,aliases,functions} ~/.extra; do
    [ -r "$file" ] && source "$file"
done
unset file

#source ~/.config/bash/bashmarks.sh

# Case-insensitive globbing (used in pathname expansion)
#shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
#complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Finder Dock Mail Safari iTunes iCal Address\ Book SystemUIServer" killall

# Workspace
export WORKSPACE=/usr/workspace/$USER

# Source spack environment
export SPACK_ROOT=${HOME}/spack
. $SPACK_ROOT/share/spack/setup-env.sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
