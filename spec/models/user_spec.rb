require "rails_helper"

RSpec.describe User, :type => :model do
  it "validates name when valid" do
    andy = User.create(name: "Andy Lindeman")

    expect(andy.valid?).to eq true
    expect(User.last).to eq andy
  end

  it "validates name when invalid" do
    user = User.create

    expect(user.valid?).to eq false
    expect(User.count).to eq 0
  end
end
