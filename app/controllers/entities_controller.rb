class EntitiesController < ApplicationController
  def create
    @entity = Entity.new(params[:entity])
    if @entity.save
      render json: @entity.to_json, status: 200
    else
      render json: @entity.errors.full_messages.to_json, status: 422
    end
  end
end