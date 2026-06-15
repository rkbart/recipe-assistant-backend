class DocumentChunker
  CHUNK_SIZE = 500

  def self.call(text)
    new(text).call
  end

  def initialize(text)
    @text = text
  end

  def call
    @text
      .scan(/.{1,#{CHUNK_SIZE}}/m)
      .map(&:strip)
      .reject(&:empty?)
  end
end