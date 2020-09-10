class CountryPostsController < ApplicationController

  def show
    @country = Country.find(params[:id])
    @posts = Post.where(country_id: params[:id]).order("created_at DESC")
  end

end
