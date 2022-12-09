# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    login { 'masterlogin' }
  end

  factory :post do
    title { 'test title' }
    body { 'test body' }
    user_id { 1 }
    ip { '123.0.0.7' }
  end

  factory :rating do
    user_id { 1 }
    post_id { 1 }
    value { 4 }
  end
end
