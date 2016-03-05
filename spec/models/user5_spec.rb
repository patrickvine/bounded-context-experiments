# == Schema Information
#
# Table name: user5s
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User5, type: :model do
  describe "wrap and delegate it - PORO" do
    it "validates name when valid" do
      andy = User5.new(name: "Andy Lindeman")
      expect(andy.valid?).to eq true
    end

    it "validates name when invalid" do
      user = User5.new
      expect(user.valid?).to eq false
    end

    it "OPTIONAL VALUDATION: validates email when InvitableUser4" do
      andy = User5.new(name: "Andy Lindeman")
      invitable_andy = InvitableUser5.new(andy)
      expect(invitable_andy.valid?).to eq false
    end

    it "OPTIONAL VALUDATION: validates email" do
      andy = User5.new(name: "Andy Lindeman", email: 'andy@dot.com')
      invitable_andy = InvitableUser5.new(andy)
      expect(invitable_andy.valid?).to eq true
    end

    it "still validates name" do
      andy = User5.new(email: 'andy@dot.com')
      invitable_andy = InvitableUser5.new(andy)
      expect(invitable_andy.valid?).to eq false
    end
  end
end
