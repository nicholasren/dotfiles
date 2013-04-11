#!/usr/bin/env ruby
require "fileutils"

def build_file_content prj_name
  <<-EOS
name := \"#{prj_name}\"

version := \"1.0.0\"

scalaVersion := \"2.9.2\"

libraryDependencies += \"org.scalatest\" %% \"scalatest\" % \"1.8\" % \"test\"

libraryDependencies += \"junit" % "junit\" % \"4.10\" % \"test\"
  EOS
end


def plugin_file_content
  "addSbtPlugin(\"com.typesafe.sbteclipse\" % \"sbteclipse-plugin\" % \"2.1.2\")"
end


def create_build_file prj_name
  File.open('build.sbt', 'w') do |f|
    f.puts build_file_content(prj_name)
  end
end

def create_src_folds
    [
      "src/main/scala",
      "src/main/java",
      "src/main/resources",
      "src/test/scala",
      "src/test/java",
      "src/test/resources",
      "project"
    ].each do |dir|
      FileUtils.mkdir_p dir
    end
end


def create_plugin_file
  File.open('project/plugins.sbt', 'w') do |f|
    f.puts plugin_file_content
  end
end

def create_scaffold prj_name
  FileUtils.mkdir_p prj_name
  FileUtils.cd prj_name do
    create_src_folds
    create_build_file prj_name
    create_plugin_file
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
