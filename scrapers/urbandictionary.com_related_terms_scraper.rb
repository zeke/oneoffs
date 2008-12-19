%w{rubygems cgi open-uri hpricot mechanize}.each {|lib| require lib}

def get_related_terms term
  agent = WWW::Mechanize.new
  url = "http://www.urbandictionary.com/define.php?term=#{term}"
  doc = Hpricot(agent.get(url).parser.to_s)
  (doc/"#tags"/"a").map! {|w| w.inner_html}
end

level_one_terms = get_related_terms "boobs"
level_two_terms = []

level_one_terms.each do |term|
  level_two_terms << get_related_terms(term)
end

puts level_one_terms.join(", ")
puts "\n\n"
puts level_two_terms.flatten.join(", ")