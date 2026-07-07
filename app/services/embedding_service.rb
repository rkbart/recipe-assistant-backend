class EmbeddingService
  def self.call(text)
    response = RubyLLM.embed(
      text,
      model: "nomic-embed-text"
    )

    response["embedding"] || response[:embedding]
  end
end
