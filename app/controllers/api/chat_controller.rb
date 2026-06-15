class Api::ChatController < ApplicationController
  def create
    result = RecipeAssistantService.call(params[:question])

    render json: result
  end
end