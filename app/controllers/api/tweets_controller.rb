class Api::TweetsController < ApiController

  def index
    tweets = Tweet.all
    render json: tweets, status: :ok
  end
end