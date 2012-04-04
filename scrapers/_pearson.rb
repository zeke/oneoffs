%w(rubygems anemone nokogiri open-uri).each {|lib| require lib}

used_filenames = Dir.glob("*")

Anemone.crawl("http://commons.wikimedia.org/w/index.php?title=Category:Pearson_Scott_Foresman_publisher&from=0") do |anemone|
  anemone.on_pages_like(/pearson|File:/i) do |page|
    next unless page.url.to_s.include? "File:"
    next unless page.doc
    links = page.doc.css('a').select{|a| a['href'] && a['href'].include?("upload.wikimedia.org") && a.text.include?("Full resolution") }
    links.each do |link|
      url = "http:" + link['href']
      filename = url.split("/").last.downcase.sub('_%28psf%29', '')
      next if used_filenames.include? filename
      puts filename
      open(filename, 'wb') { |file| file << open(url).read }
      used_filenames << filename
    end 
  end
end