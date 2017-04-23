#!/usr/bin/env ruby

require_relative "../config/environment"

author_mappings = [
    { from: ['blake@blakeperdue.com'], to: 'blake@perdue.me' },
    { from: ['xrskershaw@gmail.com', 'ckershaw@nc.rr.com'], to: 'chris.kershaw@ingramcontent.com' },
    { from: ['dave@BOML202100.home', 'dave@BOML202100.local'], to: 'dcampbell@vpg.com' },
    { from: ['erin.szarpa@ingramdigital.com'], to: 'erin.szarpa@ingramcontent.com' },
    { from: ['manton@me.com', 'manton@riverfold.com'], to: 'manton.reece@ingramcontent.com' },
    { from: ['mark.bennett.mail@gmail.com'], to: 'Mark.Bennett@ingramcontent.com' },
    { from: ['github@philburrows.com', 'peburrows@gmail.com'], to: 'phil.burrows@ingramdigital.com' },
    { from: ['plindo@raml202184.ingramcontent.com'], to: 'philabian.lindo@ingramcontent.com' },
    { from: ['sibananda.kheti@synechron.com'], to: 'sibananda.kheti@ingramcontent.com' },
    #{ from: ['srikanth@srikanths-mbp-2.ingramcontent.com'], to: 'srikanth@ingramcontent.com' }
]

author_mappings.each do |author_map|
  new_author = Author.find_by(email: author_map.fetch(:to))

  author_map.fetch(:from).each do |old_email|
    old_author = Author.find_by(email: old_email)

    next unless old_author

    commits = old_author.commits

    new_author.commits = commits
    old_author.commits = []

    old_author.destroy
  end
end
