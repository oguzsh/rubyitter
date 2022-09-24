module TweetsHelper
  def tweet_owner?(tweet)
    current_user == tweet.user
  end
end
