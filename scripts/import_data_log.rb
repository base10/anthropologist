#!/usr/bin/env ruby

require_relative "../config/environment"

repository_name = ARGV.shift
file_name = ARGV.shift
repository = Repository.find_by!(name: repository_name)

importer = GitLogImporter.new(
  file: file_name,
  repository: repository
)

importer.run
