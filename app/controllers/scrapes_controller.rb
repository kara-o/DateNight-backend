require 'nokogiri'
require 'open-uri'

class ScrapesController < ApplicationController

  def get_names
    doc = Nokogiri::HTML(open('https://www.opentable.com/s/?currentview=list&size=100&sort=Popularity&source=dtp-form&covers=2&dateTime=' + Time.now.strftime('%F') + '+17%3A30&latitude=47.6115&longitude=-122.3343&term=Seattle'))
    name_divs = doc.css('.rest-row-name-text')
    names = []
    name_divs.each do |div|
      names << div.text
    end
    render json: names
  end 

end
