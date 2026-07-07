class RecipeDocument < ApplicationRecord
  has_one_attached :file

  has_many :document_chunks, dependent: :destroy
end
