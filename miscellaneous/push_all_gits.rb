#!/usr/bin/env ruby

home = File.expand_path('.')

git_dirs = Dir["**/.git"].select{|d| File.directory?(d) }

puts "\nFound #{git_dirs.size} git projects to push.."

git_dirs.each do |dir|
  project_dir = File.join(home, dir.gsub("/.git", ""))
  puts project_dir
  exec "cd #{project_dir} && git add . && git commit -a -m \"Generic auto-commit\" && cd #{home}"
end