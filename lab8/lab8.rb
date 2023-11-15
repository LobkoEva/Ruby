require 'nokogiri'
require 'open-uri'
require 'csv'

url = 'https://www.hospitalsafetygrade.org/all-hospitals'


html = URI.open(url)
doc = Nokogiri::HTML(html)

hospital_lists = []

hospital_names_links = doc.css('a[href]')

hospital_names_links.each do |link|
  link_href = link['href']
  name_hospitals = link.text.strip

  hospital_lists << {'Назва' => name_hospitals, 'Посилання' => link_href }

end

CSV.open('hospitals.csv', 'w') do |csv|
  csv << hospital_lists.first.keys
  hospital_lists.each do |hospital|
    csv << hospital.values 
  end
end