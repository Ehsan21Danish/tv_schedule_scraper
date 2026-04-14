# TV Schedule Scraper (Ruby)

## Overview
This project is a Ruby-based web scraper that extracts TV program schedules from the following URL:

https://www.zee5.com/global/tvguide

The scraper collects:
- Channel Name
- Program Start Time
- Program Title
- Program End Time


## Technologies Used
- Ruby
- HTTParty (for HTTP requests)
- Nokogiri (for HTML parsing)
- JSON (for output formatting)


## Gems Used
Install required gems using:

gem install httparty
gem install nokogiri


## Project Structure

tv_schedule_scraper/
│── tv_schedule_scraper.rb
│── README.md


## How to Run

1. Clone the repository:

git clone https://github.com/Ehsan21Danish/tv_schedule_scraper.git

2. Go to project folder:

cd tv_schedule_scraper

3. Install dependencies:

gem install httparty
gem install nokogiri

4. Run the scraper:

ruby tv_schedule_scraper.rb


## Output Format

The output is displayed in JSON format:

[
  {
    "channel_name": "Zee TV",
    "start_time": "09:00 AM",
    "end_time": "09:30 AM",
    "program_title": "Kundali Bhagya"
  }
]


## Important Note

The ZEE5 TV Guide page is dynamically rendered using JavaScript.
Because of this, the HTML response does not contain actual schedule data.

So:
- Static scraping may return empty results ([]).
- A fallback sample dataset is used to demonstrate expected output.


## Features
- Object-Oriented Ruby code
- Clean and readable structure
- JSON formatted output
- Handles empty data using fallback
