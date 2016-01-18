class HomeController < ApplicationController
before_action :authenticate_user!

  def index
    @vk = VkontakteApi::Client.new(current_user.token)
    @wall = @vk.wall.get(owner_id: current_user.uid)
  end

end
