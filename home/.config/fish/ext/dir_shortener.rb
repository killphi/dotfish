#!/usr/bin/env ruby
# shortens /very/long/directory/path to …/directory/path
# also: /home/dir/path to ~/path

inputs = $stdin.read.sub(/^#{ENV['HOME']}/, '~').split('/').last(3)

if inputs.size == 3
  inputs[0] = '…' unless inputs.first == '~'
end

puts inputs.join('/')
