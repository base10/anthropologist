#!/usr/bin/env ruby

file_path = ARGV.shift
file_lines = File.readlines(file_path)
new_lines = []

file_lines.each do |line|
  next if line.match('^$')

  if line.match('\|')
    new_lines << line.chomp
    next
  end

  line.sub!(/^\s+/, '')
  new_lines[-1] += line.chomp
end

puts new_lines
