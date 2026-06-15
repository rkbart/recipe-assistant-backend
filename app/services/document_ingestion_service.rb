class DocumentIngestionService
  def self.call(document)
    new(document).call
  end

  def initialize(document)
    @document = document
  end

  def call
    @document.document_chunks.destroy_all

    text = DocumentTextExtractor.call(@document)

    chunks = DocumentChunker.call(text)

    chunks.each do |chunk|
      embedding = EmbeddingService.call(chunk)

      @document.document_chunks.create!(
        content: chunk,
        embedding: embedding
      )
    end
  end
end