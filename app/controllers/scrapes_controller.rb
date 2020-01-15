require 'nokogiri'
require 'open-uri'

class ScrapesController < ApplicationController

  def get_names
    #byebug
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
    
    doc = Nokogiri::HTML(open('https://www.opentable.com/s/?covers=2&currentview=list&datetime=' + params[:time] + '+19%3A00&size=100&sort=Popularity' + neighborhood))
    name_divs = doc.css('.rest-row-header')
    names = []
    2.times do 
      name_divs.each do |div|
        link = div.css('a').collect{|link| link['href']}[0]
        name = div.css('.rest-row-name-text').text
        names << { link: link, name: name }
      end
      doc = Nokogiri::HTML(open('https://www.opentable.com/s/?covers=2&currentview=list&datetime=' + params[:time] + '+19%3A00&size=100&sort=Popularity' + neighborhood + '&from=100'))
    end
    render json: names
  end 

  def single_page
    info = []
    link = params[:link]
    doc = Nokogiri::HTML(open(link))
    blurb = doc.css('#overview-section > div._3c23fa05 > div > div > div').inner_text
    
    info << {blurb: blurb}
    render json: info

  end 

end

# &neighborhoodids%5B%5D=740&neighborhoodids%5B%5D=2159&neighborhoodids%5B%5D=9149  #P/G/G 1
# &neighborhoodids%5B%5D=121&neighborhoodids%5B%5D=475 #F/B 2
# &neighborhoodids%5B%5D=58 #D 3
# &neighborhoodids%5B%5D=130 #CH 4
# &neighborhoodids%5B%5D=471 #B/PP 5
# &neighborhoodids%5B%5D=458&neighborhoodids%5B%5D=5207 #QA/M 6
# &neighborhoodids%5B%5D=121&neighborhoodids%5B%5D=821 #W/F 7