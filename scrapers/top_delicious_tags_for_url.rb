%w{rubygems sinatra hpricot mechanize}.each {|lib| require lib}

# Roundabout way, filling in the form..
# page  = agent.get('http://delicious.com/url/')
# form  = page.forms[1]
# form.url = "http://cukes.info/" # ARGV[0]
# page = agent.submit(form)

# Shortcut way..
# url = "http://cukes.info/"
# page = agent.get "http://del.icio.us/url/check?show=notes_only&url=#{url}"
# doc = Hpricot(page.parser.to_s)
# tags = (doc/"a.showTag").map {|a| a.attributes['href'].split("/").last }
# puts tags.join(", ")

get '/' do
  agent = WWW::Mechanize.new
  url = "http://cukes.info/"
  page = agent.get "http://del.icio.us/url/check?show=notes_only&url=#{url}"
  doc = Hpricot(page.parser.to_s)
  tags = (doc/"a.showTag").map {|a| a.attributes['href'].split("/").last }
  tags.join(", ")
end
