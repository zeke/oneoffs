%w{rubygems cgi open-uri hpricot mechanize}.each {|lib| require lib}

agent = WWW::Mechanize.new
start_url = "http://www.kokogiak.com/logolepsy/"
stack = agent.get(start_url).links
while l = stack.pop
  next unless l.to_s.size == 1 # it's a letter link: a b c .. etc

  puts "\n\n*** #{l.to_s}\n"
  doc = Hpricot(agent.get(l.href).parser.to_s)
  words = (doc/"a").select {|a| a.attributes['href'].empty? rescue true } # only look for <a name="blah"> link type
  words.each do |w|
    name = (w/"b").first.inner_html rescue ""
    defs = w.inner_html.split("</b>").last.gsub(/<\/?[^>]*>/, "").gsub("&nbsp;", "").gsub(" - ", " ") 
    puts "#{name}: #{defs}\n"
  end
end
