%w(rubygems twitter wordnik).each {|lib| require lib }

Wordnik.configure do |config|
  config.api_key = ''
  config.username = ''
  config.password = ''
  config.logger = Logger.new('/dev/null')
end

Wordnik.authenticate

defaults = {
  :lang => "en",
  :result_type => "recent",
  :rpp => 100
}

1.upto(15) do |page|
  options[:page] = page
  Twitter.search("is not a word", options).each do |result|
    winners << result if result.text.downcase.include?("is not a word")
  end
end

winners = []

words = winners.map do |result|
  
  # Pull the word out of the tweet
  begin
    word = result.text.downcase.split("is not a word").first.split(" ").last.gsub(/\"/, "").gsub("'", "").split("..").last.gsub(".", "")
  rescue
    next
  end
  
  # Skip this word if wordnik has a definition for it
  if Wordnik.word.get_definitions(word, :limit => 1).empty?
    puts "#{word}"
  else
    puts "               #{word}"
    next
  end  
  
  {'word' => word}
end.compact

Wordnik.word_list.add_words_to_word_list('outcasts', words, :username => Wordnik.configuration.username)