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


#chrome
chrome () {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $* 2>&1 &
}

RPROMPT=$'$(vcs_info_wrapper)'

#color and promot
autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%M %{$fg[yellow]%}%~%{$reset_color%} → "

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
export VERTX_HOME=$HOME/sdks/vert.x-2.0.0-final
export SCALA_HOME=$HOME/sdks/scala-2.11.0-M7
export SPARK_HOME=$HOME/sdks/spark-0.7.3
export EMR_HOME=$HOME/sdks/elastic-mapreduce-cli
export JENV_HOME=$HOME/.jenv
export HASKELL_HOME=$HOME/Library/Haskell

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
export PATH=$VERTX_HOME/bin:$PATH
export PATH=$SPARK_HOME/bin:$PATH
export PATH=$SCALA_HOME/bin:$PATH
export PATH=$EMR_HOME:$PATH
export PATH=$JENV_HOME/bin:$PATH
export PATH=$HASKELL_HOME/bin:$PATH
export PATH=$HOME/bin:$PATH


export EDITOR=mvim
export VIM_HOME=$HOME/.vim
export CP_DOMAIN_ENV=development




#java related settings
export JAVA_OPTS="$JAVA_OPTS -Xmx4096M -XX:MaxPermSize=512M -XX:PermSize=256M"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home"
export JBOSS_HOME=/opt/jboss-soa-p.4.3.0/jboss-as

# make ruby run faster
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000

#scala option
export SBT_OPTS="-XX:MaxPermSize=512m -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9999"

# rbenv settings
export RBENV_ROOT=/usr/local/var/rbenv
# load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# load jenv
eval "$(jenv init -)"

# Load NVM function
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"

# Source my custom files
source $HOME/.dotfiles/zsh/aliases


export REA_LDAP_USER=rxiaojun
export API_DOMAIN=rca

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source $HOME/.aws/rea/gandalf.sh
