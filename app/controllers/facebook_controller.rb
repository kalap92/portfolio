require 'koala'

class FacebookController < ApplicationController
  def home
    @graph = Koala::Facebook::API.new(ENV['MY_TOKEN'])

    profile = @graph.get_object('me')
    friends = @graph.get_connections('me', 'friends')
  end
end
