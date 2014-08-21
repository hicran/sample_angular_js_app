FactoryGirl.define do
  factory :case_filter do |f|
    f.sequence(:name) { |n| "Test Case Filter #{n}"}
  end

  factory :case do |f|
    f.sequence(:name) { |n| "Test Case Filter #{n}"}
  end

  factory :label do |f|
    f.sequence(:name) { |n| "Test Case Filter #{n}"}
  end
end
