require 'rails_helper'

RSpec.describe GitLogImporter, type: :model do
  LOG_FILE = File.expand_path(
    "../../support/files/sample_repo_log.pipe_delimited.txt",
    __FILE__
  )

  let(:repository) { FactoryGirl.create(:repository) }
  let(:file_contents) { File.readlines(LOG_FILE) }

  describe "initialization" do
    it "accepts a file" do
      expect {
        GitLogImporter.new(
          file: LOG_FILE,
          repository: repository
        )
      }.not_to raise_exception
    end

    it "raises an exception when the file isn't present to read" do
      expect {
        GitLogImporter.new(file: '/tmp/fake_file', repository: repository)
      }.to raise_exception(Errno::ENOENT)
    end

    # TODO: add tests for setting/expecting repo
  end

  describe "importing" do
    let(:first_line) { file_contents.first }

    subject { GitLogImporter.new(file: LOG_FILE, repository: repository) }

    # TODO: Add tests / functionality to limit range being run

    describe "authors" do
      it "creates authors that haven't been seen before" do
        author_info = first_line.split('|')[1..2]
        name = author_info[0]
        email = author_info[1]

        expect {
          Author.find_by!(email: email)
        }.to raise_exception(ActiveRecord::RecordNotFound)

        subject.run

        expect { Author.find_by!(email: email) }.not_to raise_exception
      end
    end

    describe "commit objects" do
      it "builds with the reference" do
        test_reference = first_line.split('|')[0]

        subject.run

        expect(Commit.first.reference).to eq(test_reference)
      end

      it "builds with the author_commit_datetime" do
        author_datetime = first_line.split('|')[3]

        subject.run

        expect(Commit.first.author_datetime).to eq(author_datetime)
      end

      it "builds with a title" do
        title = first_line.split('|')[4]

        subject.run

        expect(Commit.first.title).to eq(title)
      end

      it "builds with file_statistics" do
        file_statistics = first_line.split('|')[5]

        subject.run

        expect(Commit.first.file_statistics).to eq(file_statistics)
      end

      it "associates with an author" do
        subject.run
        commit = Commit.last
        author = commit.authors.first

        expect(author).to be_kind_of(Author)
      end
    end
  end
end
