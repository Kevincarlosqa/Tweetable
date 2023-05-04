class LikesController < ApplicationController
  before_action :set_like, only: %i[ show edit update destroy ]

  # GET /likes
  def index
    @likes = Like.all
  end

  # GET /likes/1
  def show
  end

  # GET /likes/new
  def new
    create

    # @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes
  def create
    # binding.pry
    @like = Like.new(user_id: params[:user_id], tweet_id: params[:tweet_id])
    if @like.save
      # render "/", notice: "Like was successfully created."
      return
    else
  
      return
    end
  end

  # PATCH/PUT /likes/1
  def update
    if @like.update(like_params)
      redirect_to @like, notice: "Like was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /likes/1
  def destroy
    @like.destroy
    redirect_to likes_url, notice: "Like was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:user_id, :tweet_id)
    end
end
