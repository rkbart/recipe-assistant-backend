class Api::RecipeDocumentsController < ApplicationController
  
  def create
    document = RecipeDocument.new(
      title: params[:title],
      original_filename: params[:file].original_filename,
      file_type: params[:file].content_type
    )

    document.file.attach(params[:file])

    if document.save
      render json: document, status: :created
    else
      render json: { errors: document.errors.full_messages },
            status: :unprocessable_entity
    end
  end
  
end
