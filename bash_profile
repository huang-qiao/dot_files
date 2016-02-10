#!/usr/bin/env bash
export PATH=${HOME}/Tools/opengrok-0.12.1.5/bin:${PATH}
export OPENGROK_TOMCAT_BASE=/usr/local/Cellar/tomcat/8.0.30/libexec
export LIBGL_ALWAYS_SOFTWARE=1
export PATH=${PATH}:/home/qiao/Android/Sdk/platform-tools
export PATH=${PATH}:/home/qiao/Android/Sdk/ndk-bundle
export PATH=${PATH}:/home/qiao/Tools/scripts
export PATH=/usr/share/tomcat7/bin:${PATH}
export PATH=/usr/local/Cellar/tomcat/8.0.30/bin/catalina:${PATH}
export ANDROID_NDK=${HOME}/Android/Sdk/ndk-bundle
export ANDROID_NDK_HOME=$ANDROID_NDK

alias tree='tree --charset ASCII'
alias htags='htags -aFghInosxv --show-position --tabs 4'
alias rsync='rsync -rRvul --no-implied-dirs --times'
alias grep='grep --color -rns --exclude-dir=".svn" --exclude-dir=".git"'

source ${HOME}/Tools/dot_files/bash/themes/colors.theme.bash
source ${HOME}/Tools/dot_files/bash/aliases/available/general.aliases.bash

if [ -f /opt/ros/indigo/setup.bash ]; then
    source /opt/ros/indigo/setup.bash;
fi;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

source ${HOME}/Tools/dot_files/bash/completion/available/git.completion.bash
source ${HOME}/Tools/dot_files/bash/completion/available/brew.completion.bash
source ${HOME}/Tools/dot_files/bash/completion/available/defaults.completion.bash
source ${HOME}/Tools/dot_files/bash/completion/available/dirs.completion.bash

