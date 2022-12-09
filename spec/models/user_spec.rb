# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = create(:user)
  end

  it 'is valid with valid attributes' do
    expect(@user1).to be_valid
  end

  it "login can't be null" do
    user2 = build(:user, login: nil)
    expect(user2).to_not be_valid
  end
end
