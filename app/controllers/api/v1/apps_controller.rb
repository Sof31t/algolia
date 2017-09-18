class API::V1::AppsController < ApplicationController
  protect_from_forgery prepend: true

  def create
    respond_to do |format|
      format.json { render json: {} }
    end
  end

  def edit
    respond_to do |format|
      format.json { render json: {} }
    end
  end

  def update
    respond_to do |format|
      format.json { render json: {} }
    end
  end

  def destroy
    App.find(params[:id]).destroy
    render body: nil, status: 204
  end
end
