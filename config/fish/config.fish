#autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish ]

set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow) set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'


function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end


#alias
alias vi="vim"
alias gs="git st"
alias d="docker"
alias g="./gradlew"
alias vc="rm -rf $HOME/.tmp/*"
alias t="tmuxinator"
alias be="bundle exec"

#tv dashboard
alias tv="ssh aconex@192.168.7.74"

#rbenv
status --is-interactive; and source (rbenv init -|psub)
export EDITOR='vim'


#scala
set -x SCALA_HOME ~/sdks/scala-2.12.3
set fish_user_paths $SCALA_HOME/bin


#haskell
set -x LOCAL    ~/.local/
set fish_user_paths $LOCAL/bin


#tmuxifier
set -x TMUXIFIER_HOME ~/.tmuxifier
set fish_user_paths $TMUXIFIER_HOME/bin


#jenv
set PATH $HOME/.jenv/bin $PATH
