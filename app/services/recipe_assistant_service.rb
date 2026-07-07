class RecipeAssistantService
  def self.call(question)
    new(question).call
  end

  def initialize(question)
    @question = question
  end

  def call
    chunks = RecipeSearchService.call(@question)

    context = chunks.map(&:content).join("\n\n")

    prompt = <<~PROMPT
      You are a cooking assistant.

      Use ONLY the context below.

      If the answer is not in the context, say:
      "I could not find that in the uploaded recipes."

      Context:
      #{context}

      Question:
      #{@question}
    PROMPT

    client = RubyLLM::Client.new

    response = client.chat(
      model: "mistral",
      messages: [
        { role: "user", content: prompt }
      ]
    )

    {
      answer: response["message"]["content"],
      sources: chunks.map(&:recipe_document_id).uniq
    }
  end
end
