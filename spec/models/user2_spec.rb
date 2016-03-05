# == Schema Information
#
# Table name: user2s
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User2, type: :model do
  describe "optional mixin" do
    it "validates name when valid" do
      andy = User2.new(name: "Andy Lindeman")
      expect(andy.valid?).to eq true
    end

    it "validates name when invalid" do
      user = User2.new
      expect(user.valid?).to eq false
    end

    it "OPTIONAL VALUDATION: validates email when with_invitable true" do
      andy = User2.new(name: "Andy Lindeman")
      andy.validate_invitable
      expect(andy.valid?).to eq false
    end

    it "OPTIONAL VALUDATION: validates email" do
      andy = User2.new(name: "Andy Lindeman", email: 'andy@dot.com')
      andy.validate_invitable
      expect(andy.valid?).to eq true
    end
  end
end
