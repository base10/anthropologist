class GitLogImporter
  attr_reader :file, :file_contents, :repository

  def initialize(file:, repository:)
    @file = file
    @file_contents = File.readlines(@file)
    @repository = repository
  end

  def run
    file_contents.each do |line|
      process_line(line: line)
    end
  end

  private

  def process_line(line:)
    mapped_result = map_line_to_segments(line: line)
    author = handle_author_data(mapped_result: mapped_result)

    commit = Commit.new(
      reference: mapped_result.reference,
      title: mapped_result.title,
      author_datetime: mapped_result.author_datetime,
      file_statistics: mapped_result.file_statistics,

      repository: repository,
    )

    commit.authors << author
    commit.save!
  end

  def map_line_to_segments(line: line)
    parts = line.split('|')

    MappedResult.new(
      reference: parts[0],
      author_name: parts[1],
      author_email: parts[2],
      author_datetime: parts[3],
      title: parts[4],
      file_statistics: parts[5]
    )
  end

  def handle_author_data(mapped_result:)
    Author.find_or_create_by!(
      email: mapped_result.author_email,
      name: mapped_result.author_name
    )
  end

  class MappedResult < OpenStruct
  end
end
