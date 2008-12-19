require 'rubygems'
require 'cgi'
require 'open-uri'
require 'hpricot'
require 'mechanize'
agent = WWW::Mechanize.new

q = "canard"

url = "http://wordreference.com/fren/#{q}"


doc = Hpricot(agent.get(url).parser.to_s)

words = (doc/"td.ToW")

puts "Number of Words: #{words.size}"
words.each do |word|
  puts word.inner_html
end

# We found no English translation for 'brinquebaler' in our French to English Dictionary.

# Sample result:
=begin
<tr class="even">
<td class="FrW">canard</td>
<td class="FrCN"> (mauvaise fabrication)</td>
<td class="POS">n</td>
<td class="ToW">canard</td>
</tr>
<tr class="even">
<td class="Head" colspan="5">Compound Forms/Formes composées</td>
</tr>
<tr class="odd">
<td class="FrCN" colspan="2">
</td>
<td class="POS"/>
<td class="ToW">peacock blue</td>
</tr>
=end