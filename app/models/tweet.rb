class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :retweet, class_name: "Tweet", foreign_key: "tweet_id", optional: true

  validates :body, length: { maximum: 240 }, allow_blank: false, unless: :tweet_id

  def tweet_type
    if tweet_id? && body?
      'quote-tweet'
    elsif tweet_id?
      'retweet'
    else
      'tweet'
    end
  end
end
