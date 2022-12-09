# frozen_string_literal: true

class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :value

      t.timestamps
    end
  end
end
