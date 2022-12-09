# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :post_id, :user_id, :value, presence: true

  validates_uniqueness_of :post_id, scope: :user_id
end
