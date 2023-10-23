require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  before do
    Article.create(title: 'First Article', description: 'article')
    Article.create(title: 'Second Article', description: 'article')
    Article.create(title: 'Third Article', description: 'article')
  end

  scenario 'Get all articles and check the array length' do
    get 'http://localhost:3000/articles'
    expect(response).to have_http_status(:success)
    articles = JSON.parse(response.body)
    expect(articles.length).to eq(5)
  end
end
