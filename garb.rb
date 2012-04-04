require 'rubygems'
require 'garb'

if ARGV.size < 3
  puts "\nUsage: ruby garb.rb <username> <password> <UA-XXXXXXX-X>\n\n"
  exit
end

username = ARGV[0]
password = ARGV[1]
ua = ARGV[2]

class PageViews
  extend Garb::Model
  metrics :pageviews
  dimensions :page_path
end

class Reports
  def self.top_word_lookups(profile, weeks_ago=1)
    PageViews.results(
      profile,
      :start_date => (Date.today - 7*weeks_ago),
      :end_date => (Date.today - 7*(weeks_ago-1)),
      :filters => {:pageviews.gte => 100, :page_path.contains => '/words/'},
      :sort => :pageviews
    )    
  end
end

Garb::Session.login(username, password)
profile = Garb::Management::Profile.all.detect {|p| p.web_property_id == ua}

1.upto(6) do |weeks_ago|
  puts "\n\nTop Lookups, #{weeks_ago} week(s) ago"
  results = Reports.top_word_lookups(profile, weeks_ago)
  results.entries.reverse.map do |entry|
    word = entry.page_path.split("words/").last
    count = entry.pageviews.to_i
    puts [word, " " * (40-word.size), count].join("")
  end
end