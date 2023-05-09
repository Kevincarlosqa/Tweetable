class Api::TweetsController < ApiController

  def index
    tweets = Tweet.all
    render json: tweets, status: :ok
  end

  def show
    replies = []
    tweet = Tweet.find(params[:id])
    tweet.replies.each do |replie|
      replies << replie
    end
    render json: [tweet, replies], status: :ok
  end

end