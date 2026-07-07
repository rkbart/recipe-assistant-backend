class AddVectorIndexToDocumentChunks < ActiveRecord::Migration[8.0]
  def change
    return unless column_exists?(:document_chunks, :embedding)

    add_index :document_chunks,
              :embedding,
              using: :hnsw,
              opclass: :vector_cosine_ops
  end
end
