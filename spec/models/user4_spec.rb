# == Schema Information
#
# Table name: user4s
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User4, type: :model do
  describe "wrap and delegate it - SimpleDelegator" do
    it "validates name when valid" do
      andy = User4.new(name: "Andy Lindeman")
      expect(andy.valid?).to eq true
    end

    it "validates name when invalid" do
      user = User4.new
      expect(user.valid?).to eq false
    end

    it "OPTIONAL VALUDATION: validates email when InvitableUser4" do
      andy = User4.new(name: "Andy Lindeman")
      invitable_andy = InvitableUser4.new(andy)
      expect(invitable_andy.valid?).to eq false
    end

    it "OPTIONAL VALUDATION: validates email" do
      andy = User4.new(name: "Andy Lindeman", email: 'andy@dot.com')
      invitable_andy = InvitableUser4.new(andy)
      expect(invitable_andy.valid?).to eq true
    end

    it "still validates name" do
      andy = User4.new(email: 'andy@dot.com')
      invitable_andy = InvitableUser4.new(andy)
      expect(invitable_andy.valid?).to eq false
    end
  end
end
