class TestController < ApplicationController
  def hello_world
    render json: { message: 'Hello World!' }
  end

  def test
    render json: { message: 'Test' }
  end
end
