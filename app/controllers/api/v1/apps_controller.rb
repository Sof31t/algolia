class API::V1::AppsController < ApplicationController
  protect_from_forgery prepend: true

  def create
    App.create!(data: sanitized_params)
    render body: nil, status: 204
  end

  def update
    App.find(params[:id]).update_attributes!(data: sanitized_params)
    render body: nil, status: 204
  end


  def destroy
    App.find(params[:id]).destroy!
    render body: nil, status: 204
  end

  private

  def sanitized_params
    {
      name: post_params[:name],
      image: post_params[:image],
      link: post_params[:link],
      category: post_params[:category],
      rank: post_params[:rank].match(/^\d+$/) ? post_params[:rank].to_i : "",
    }
  end

  def post_params
    @post_params ||= params.permit(:id, :name, :image, :link, :category, :rank)
  end

end
