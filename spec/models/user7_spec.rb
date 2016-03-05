# == Schema Information
#
# Table name: user7s
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User7, type: :model do
  describe "inject the validations" do
    it "validates name when valid" do
      andy = User7.new(name: "Andy Lindeman")
      expect(andy.valid?).to eq true
    end

    it "validates name when invalid" do
      user = User7.new
      expect(user.valid?).to eq false
    end

    it "OPTIONAL VALUDATION: validates email when InvitableUser4" do
      andy = User7.new(name: "Andy Lindeman")
      andy.add_validation(InvitableValidator.new)
      expect(andy.valid?).to eq false
    end

    it "OPTIONAL VALUDATION: validates email" do
      andy = User7.new(name: "Andy Lindeman", email: 'andy@dot.com')
      andy.add_validation(InvitableValidator.new)
      expect(andy.valid?).to eq true
      expect(andy.invite!).to eq 'Send a mail to Andy Lindeman andy@dot.com'
    end

    it "still validates name" do
      andy = User7.new(email: 'andy@dot.com')
      andy.add_validation(InvitableValidator.new)
      expect(andy.valid?).to eq false
    end
  end
end
