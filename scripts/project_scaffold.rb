#!/usr/bin/env ruby
require "fileutils"

def build_file_content prj_name
  <<-EOS
name := \"#{prj_name}\"

version := \"0.1\"

scalaVersion := \"2.10.1\"

libraryDependencies += \"org.scalatest\" % \"scalatest_2.10\" % \"1.9.1\" % \"test\"
  EOS
end

def create_build_file prj_name
  File.open('build.sbt', 'w') do |f|
    f.puts build_file_content(prj_name)
  end
end

def create_src_folds
    [
      "src/main/scala",
      "src/main/resources",
      "src/test/scala",
      "src/test/resources",
    ].each do |dir|
      FileUtils.mkdir_p dir
    end
end

def create_scaffold prj_name
  FileUtils.mkdir_p prj_name
  FileUtils.cd prj_name do
    create_src_folds
    create_build_file prj_name
  end
end

# creating a scala project scaffold
if ARGV.empty?
  puts "need to supply project name!"
else
  prj_name = ARGV[0]
  create_scaffold prj_name
  puts "creating project #{prj_name} succeed!"
end
