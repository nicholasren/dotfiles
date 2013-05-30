#!/usr/bin/env ruby
require "fileutils"

def create_scaffold prj_name
  FileUtils.mkdir_p prj_name
  FileUtils.cd prj_name do
    [
      "src/main/scala",
      "src/main/java",
      "src/main/resources",
      "src/test/scala",
      "src/test/java",
      "src/test/resources"
    ].each do |dir|
      FileUtils.mkdir_p dir
    end

    FileUtils.touch "build.sbt"
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
