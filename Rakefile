require 'rake'


desc "install vim configuration"
task :vim do
  backup_file 'vim'
  backup_file 'vimrc'
  backup_file 'gvimrc'
  link_file "vim"
  link_file "vimrc"
  link_file ".gvimrc"
  vundle
  create_vim_tmp_dir
end

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README LICENSE id_dsa.pub].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end

  # Handle ssh pubkey on its own
  puts "Linking public ssh key"
  system %Q{rm "$HOME/.ssh/id_dsa.pub"}
  system %Q{ln -s "$PWD/id_dsa.pub" "$HOME/.ssh/id_dsa.pub"}

  system %Q{mkdir ~/.tmp}
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end

def backup_file(file)
  puts "backuping file ~/.#{file}"
  system "[ -f ~/.#{file} ] && mv -i ~/.#{file}{,.bak}"
end

def vundle
  vundle_home = "~/.vim/bundle/vundle"
  system "git clone https://github.com/gmarik/vundle.git #{vundle_home}" unless File.exists?(File.join(ENV['HOME'], vundle_home))
  system "vim +BundleInstall +qall"
end

def create_vim_tmp_dir
  unless File.exists?("~/.tmp")
    system "mkdir ~/.tmp"
  end
end
