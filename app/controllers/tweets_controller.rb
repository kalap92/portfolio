class TweetsController < ApplicationController
  KRAKOW_WOEID = 502075

  def home
    trending_tweets
    gon.trending_hashtags = @trending_hashtags
  end

  private

  def trending_tweets(woeid=KRAKOW_WOEID)
    twitter_init
    @trending_hashtags = tweets_names(@client.trends(id = woeid))
  end

  def tweets_names(trends)
    trends.attrs[:trends].map { |trend| trend[:name] } || ['none']
  end

  def twitter_init
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end
end 
