class SearchController < ApplicationController
  def index
    @facade = AvatarFacade.new(params)
  end
end