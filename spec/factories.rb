require 'securerandom'

FactoryGirl.define do
  trait :random_hash do
    SecureRandom.hex(20) # Will yield a 40 character string
  end

  factory :commit do
    reference random_hash
    title "This is a meaningful commit message"
    file_statistics "1 file changed, 1 insertion(+), 1 deletion(-)"
    author_datetime 1.day.ago
    repository
  end

  factory :author do
    name "Jane Committer"
    sequence(:email) { |n| "j.committer+#{n}@example.com" }
  end

  factory :repository do
    sequence(:name) { |n| "fun_repo_name_#{n}" }
    url "https://github.com/example/fun_repo_name"
    local_path "/var/tmp/code/fun_repo_name"
  end
end
