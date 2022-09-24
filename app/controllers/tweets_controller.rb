class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.order(created_at: :asc)
  end

  def create
  end

  def destroy
  end
end
