class SearchController < ApplicationController
  def index
    q = params[:q]
    respond_to do |format|
      format.json { render json: User.search(q) }
    end
  end
end
