class RecreateEmbeddingColumnOnDocumentChunks < ActiveRecord::Migration[8.0]
  def change
    # safety: remove if partially created
    if column_exists?(:document_chunks, :embedding)
      remove_column :document_chunks, :embedding
    end

    add_column :document_chunks, :embedding, :vector, limit: 768
  end
end