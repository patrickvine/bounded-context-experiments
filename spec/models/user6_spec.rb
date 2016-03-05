# == Schema Information
#
# Table name: user6s
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User6, type: :model do
  describe "invite command" do
    it "validates name when valid" do
      andy = User6.new(name: "Andy Lindeman")
      expect(andy.valid?).to eq true
    end

    it "validates name when invalid" do
      user = User6.new
      expect(user.valid?).to eq false
    end

    it "OPTIONAL VALUDATION: validates email when InvitableUser4" do
      andy = User6.new(name: "Andy Lindeman")
      invitable_andy = InvitableCommand.new(andy)
      expect(invitable_andy.valid?).to eq false
    end

    it "OPTIONAL VALUDATION: validates email" do
      andy = User6.new(name: "Andy Lindeman", email: 'andy@dot.com')
      invitable_andy = InvitableCommand.new(andy)
      expect(invitable_andy.valid?).to eq true
      expect(invitable_andy.invite!).to eq 'Send a mail to Andy Lindeman andy@dot.com'
    end

    it "still validates name" do
      andy = User6.new(email: 'andy@dot.com')
      invitable_andy = InvitableCommand.new(andy)
      expect(invitable_andy.valid?).to eq false
    end
  end
end
