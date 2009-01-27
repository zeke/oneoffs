#!/usr/bin/env ruby

home = File.expand_path('.')

Dir["**/.git"].map do |dir|
  if File.directory?(dir)
    project_dir = File.join(home, dir.gsub("/.git", ""))
    puts project_dir
    exec "cd #{project_dir} && git pull"
    exec "cd #{home}"
  end
end