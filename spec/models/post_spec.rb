require "rails_helper"

RSpec.describe Post, :type => :model do
  
  before(:all) do
    @post1 = create(:post)
  end
  
  puts @post1
  
  it "is valid with valid attributes" do
    expect(@post1).to be_valid
  end

  it "user_id can't be null" do
    post2 = build(:post, user_id: nil)
    expect(post2).to_not be_valid
  end

  it "title can't be null" do
    post2 = build(:post, title: nil)
    expect(post2).to_not be_valid
  end

  it "body can't be null" do
    post2 = build(:post, body: nil)
    expect(post2).to_not be_valid
  end

  it "ip can't be null" do
    post2 = build(:post, ip: nil)
    expect(post2).to_not be_valid
  end

   
end