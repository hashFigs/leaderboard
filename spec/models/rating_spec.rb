require "rails_helper"

RSpec.describe Rating, :type => :model do
  
  before(:all) do
    @user1 = create(:user)
    @post1 = create(:post)
    @rating1 = create(:rating, user_id:@user1.id, post_id: @post1.id, value:4)
    
  end

  
  it "is valid with valid attributes" do
    expect(@rating1).to be_valid
  end

  it "post_Id can't be null" do
    rating2 = build(:rating, user_id:1, post_id: nil, value:4)
    expect(rating2).to_not be_valid
  end

  it "user_Id can't be null" do
    rating2 = build(:rating, user_id: nil)
    expect(rating2).to_not be_valid
  end

  it "value can't be null" do
    rating2 = build(:rating, value: nil)
    expect(rating2).to_not be_valid
  end


end