class DocumentTextExtractor
  def self.call(document)
    new(document).call
  end

  def initialize(document)
    @document = document
  end

  def call
    extension = File.extname(@document.file.filename.to_s).downcase

    case extension
    when ".txt", ".md"
      @document.file.download
    when ".pdf"
      extract_pdf
    else
      raise "Unsupported file type: #{extension}"
    end
  end

  private

  def extract_pdf
    tempfile = Tempfile.new([ "recipe", ".pdf" ])

    tempfile.binmode
    tempfile.write(@document.file.download)
    tempfile.rewind

    reader = PDF::Reader.new(tempfile.path)

    reader.pages.map(&:text).join("\n")
  ensure
    tempfile.close
    tempfile.unlink
  end
end
