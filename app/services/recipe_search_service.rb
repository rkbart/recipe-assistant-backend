class RecipeSearchService
  def self.call(question, limit: 5)
    new(question, limit).call
  end

  def initialize(question, limit)
    @question = question
    @limit = limit
  end

  def call
    query_embedding = EmbeddingService.call(@question)

    DocumentChunk
      .nearest_neighbors(:embedding, query_embedding, distance: :cosine)
      .limit(@limit)
  end
end