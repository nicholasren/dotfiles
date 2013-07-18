#git promte
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

RPROMPT=$'$(vcs_info_wrapper)'

#color and promot
autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~%{$reset_color%} → "

#PATH configure section
export TERM="xterm-color"
export PATH=~/bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$PATH
export MYSQL_HOME=/usr/local/mysql
export MSPEC_HOME=$HOME/projects/mspec
export MONGODB_HOME=$HOME/Apps/mongodb-osx-x86_64-2.0.5
export GRADLE_HOME=$HOME/sdks/gradle-1.5
export PLAY_HOME=$HOME/sdks/play-2.0.4
export GATLING_HOME=$HOME/sdks/gatling-charts-highcharts-1.4.2
export EC2_HOME=$HOME/sdks/ec2-api-tools-1.6.6.3
export WKHTMLTOPDF_HOME=/Applications/wkhtmltopdf.app/Contents/MacOS
export JITSU_HOME=/usr/local/share/npm/
export JETTY_HOME=$HOME/personal/reinventing_wheels/jetty
export FIREFOX_HOME=/Applications/firefoxs/Firefox.app/Contents/MacOS

export PATH=~/bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$MYSQL_HOME/bin:$PATH
export PATH=$MSPEC_HOME/bin:$PATH
export PATH=$MONGODB_HOME/bin:$PATH
export PATH=$GRADLE_HOME/bin:$PATH
export PATH=$PLAY_HOME:$PATH
export PATH=$GATLING_HOME:$PATH
export PATH=$EC2_HOME/bin:$PATH
export PATH=$WKHTMLTOPDF_HOME:$PATH
export PATH=$JITSU_HOME/bin:$PATH
export PATH=$FIREFOX_HOME:$PATH

export EDITOR=mvim
export VIM_HOME=$HOME/.vim

export CP_DOMAIN_ENV=development

#java related settings
export JAVA_OPTS="$JAVA_OPTS -Xmx2048M"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home"
export JBOSS_HOME=/opt/jboss-soa-p.4.3.0/jboss-as

# make ruby run faster
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000

#tomcat related settings
export CATALINA_HOME=${HOME}/Apps/tomcat/6.0.35
export CATALINA_BASE=$CATALINA_HOME

#scala option
export SBT_OPTS=-XX:MaxPermSize=256m

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Load NVM function
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"

# Source my custom files
source $HOME/.dotfiles/zsh/aliases
