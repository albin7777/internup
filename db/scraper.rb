require 'nokogiri'

filepath = "db/results.html"

html_content = File.open(filepath)

doc = Nokogiri::HTML(html_content)

internship_title = []
doc.search('.job-result-card__title').each do |element|
  internship_title << element.text.strip
end

internship_description = []
doc.search('.job-result-card__snippet').each do |element|
  internship_description << element.text.strip
end
