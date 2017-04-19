FactoryGirl.define do
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
