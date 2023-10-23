require 'open-uri'

class UrlCrawlJob
  include Sidekiq::Job

  def perform(url_id, link)
    doc = Nokogiri::HTML.parse(URI.open(link))
    # Get page's title
    # puts doc.title

    url = Url.find(url_id)
    url.page_title = doc.title
    url.save
  end
end
