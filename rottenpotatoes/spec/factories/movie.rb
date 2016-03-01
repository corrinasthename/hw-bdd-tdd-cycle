# spec/factories/movie.rb

FactoryGirl.define do
    factory :movie do |m|
        m.title     "A Fake Title"
        m.rating  "PG"
        m.release_date {10.years.ago}
    end
end