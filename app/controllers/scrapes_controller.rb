require 'nokogiri'
require 'open-uri'

class ScrapesController < ApplicationController

  def get_names
    neighborhood = ''

    if params[:location] == 'p/g/g'
      neighborhood = '&neighborhoodids%5B%5D=740&neighborhoodids%5B%5D=2159&neighborhoodids%5B%5D=9149'
    elsif params[:location] == 'b/f'
      neighborhood = '&neighborhoodids%5B%5D=121&neighborhoodids%5B%5D=475'
    elsif params[:location] == 'd'
      neighborhood = '&neighborhoodids%5B%5D=58'
    elsif params[:location] == 'ch'
      neighborhood = '&neighborhoodids%5B%5D=130'
    elsif params[:location] == 'bell/pp'
      neighborhood = '&neighborhoodids%5B%5D=471'
    elsif params[:location] == 'qa/m'
      neighborhood = '&neighborhoodids%5B%5D=458&neighborhoodids%5B%5D=5207'
    elsif params[:location] == 'w/f'
      neighborhood = '&neighborhoodids%5B%5D=121&neighborhoodids%5B%5D=821'
    else
      neighborhood = '&regionids%5B%5D=1'
    end
    
    doc = Nokogiri::HTML(open('https://www.opentable.com/s/?covers=2&currentview=list&datetime=' + (Time.now + 604800).strftime('%F') + '+19%3A00&size=100&sort=Popularity' + neighborhood))
    name_divs = doc.css('.rest-row-name-text')
    names = []
    2.times do 
      name_divs.each do |div|
        names << div.text
      end
      doc = Nokogiri::HTML(open('https://www.opentable.com/s/?covers=2&currentview=list&datetime=' + (Time.now + 604800).strftime('%F') + '+19%3A00&size=100&sort=Popularity' + neighborhood + '&from=100'))
    end
    render json: names
  end 

end

# &neighborhoodids%5B%5D=740&neighborhoodids%5B%5D=2159&neighborhoodids%5B%5D=9149  #P/G/G 1
# &neighborhoodids%5B%5D=121&neighborhoodids%5B%5D=475 #F/B 2
# &neighborhoodids%5B%5D=58 #D 3
# &neighborhoodids%5B%5D=130 #CH 4
# &neighborhoodids%5B%5D=471 #B/PP 5
# &neighborhoodids%5B%5D=458&neighborhoodids%5B%5D=5207 #QA/M 6
# &neighborhoodids%5B%5D=121&neighborhoodids%5B%5D=821 #W/F 7