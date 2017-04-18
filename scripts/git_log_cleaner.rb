#!/usr/bin/env ruby

file_path = ARGV.shift
file_lines = File.readlines(file_path)
new_lines = []

file_lines.each do |line|
  parts = line.split('|')
  file_stats = parts.last
  file_stats.sub!(/^\s+/, '')
  file_stats = "#{file_stats}"
  new_lines << parts.join('|')
end

puts new_lines

