#
# Grab random pages from wikipedia and get their word count and average word length

require 'rubygems'
require 'nokogiri'
require 'open-uri'

10.times do
  
  doc = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/Special:Random'))
  paragraphs = doc.css('div#bodyContent p').map { |p| p.content.gsub(/<\/?[^>]*>/, "") }
  body = paragraphs.join(" ")
  words = body.split(" ").size # isolate each word
  letters = body.gsub(/\W/, "").size # remove nonword characters

  puts "Article: #{doc.css('#firstHeading').first.content}"
  puts "word count: #{words}"
  puts "letter count: #{letters}"
  puts "average letters per word: #{letters.to_f / words.to_f}"
  puts "\n\n"

end