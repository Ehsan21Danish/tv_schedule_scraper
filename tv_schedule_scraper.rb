
require 'httparty'
require 'nokogiri'
require 'json'

class TvScheduleScraper
  BASE_URL = "https://www.zee5.com/global/tvguide"

  def initialize(date = nil)
    @date = date || Time.now.strftime("%Y-%m-%d")
    @programs = []
  end   

  def scrape
    html = fetch_page
    parse_page(html)
    @programs
  end

  def to_json
    JSON.pretty_generate(@programs)
  end

  private

  def fetch_page
    puts "Fetching TV schedule for #{@date}..."
    
    response = HTTParty.get(BASE_URL, headers: {
      "User-Agent" => "Mozilla/5.0"
    })

    if response.code != 200
      raise "Failed to fetch data: #{response.code}"
    end

    response.body
  end

  def parse_page(html)
    doc = Nokogiri::HTML(html)


    channels = doc.css('.channel-container')

    channels.each do |channel|
      channel_name = channel.css('.channel-name').text.strip

      programs = channel.css('.program-item')

      programs.each do |program|
        start_time = program.css('.start-time').text.strip
        end_time = program.css('.end-time').text.strip
        title = program.css('.program-title').text.strip

        @programs << {
          channel_name: channel_name,
          start_time: start_time,
          end_time: end_time,
          program_title: title
        }
      end
    end
  end
end


if __FILE__ == $0
  scraper = TvScheduleScraper.new
  data = scraper.scrape

  puts "\nTV Schedule:\n\n"
  puts scraper.to_json
end