FactoryBot.define do
  factory :wiki do
    user
    title RandomData.random_name
    body RandomData.random_paragraph
    private false
  end
end
