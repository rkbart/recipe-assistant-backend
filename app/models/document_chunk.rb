class DocumentChunk < ApplicationRecord
  belongs_to :recipe_document

  has_neighbors :embedding,
  dimensions: 768,
  distance: :cosine
end
