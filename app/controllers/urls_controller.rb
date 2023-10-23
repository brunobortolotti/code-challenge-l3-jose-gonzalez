class UrlsController < ApplicationController
  def index
    urls = Url.all
    render json: urls
  end

  def show_url
    url = Url.find_by_token(params[:id])
    if url.nil?
      render json: { error: "Url not found" }
    else
      if url.visited_count.nil?
        url.visited_count = 1
      else
        url.visited_count += 1
      end
      url.save
      redirect_to url.original_link, allow_other_host: true
    end
  end

  def create
    new_url = Url.new(url_params)

    last_url = Url.order(token: :desc).first
    if last_url.nil?
      new_url.token = 'a'
    else
      new_url.token = last_url.token.succ
    end

    if new_url.save
      UrlCrawlJob.perform_async new_url.id, new_url.original_link
      render json: { short_link: new_url.get_short_url }, status: :created
    else
      render json: { errors: new_url.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show_top_100
    urls = Url.order(visited_count: :desc).limit(100)
    my_urls = urls.map { |u| { short_link: u.get_short_url, title: u.page_title, link: u.original_link, visits: u.visited_count } }
    render json: my_urls
  end

  private

  def url_params
    params.permit(:original_link)
  end
end
