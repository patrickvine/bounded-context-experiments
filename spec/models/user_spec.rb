# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe User, :type => :model do
  describe "iffy in model" do
    it "validates name when valid" do
      andy = User.new(name: "Andy Lindeman")
      expect(andy.valid?).to eq true
    end

    it "validates name when invalid" do
      user = User.new
      expect(user.valid?).to eq false
    end

    it "OPTIONAL VALUDATION: validates email when with_invitable true" do
      andy = User.new(name: "Andy Lindeman")
      andy.validate_invitable
      expect(andy.valid?).to eq false
    end

    it "OPTIONAL VALUDATION: validates email" do
      andy = User.new(name: "Andy Lindeman", email: 'andy@dot.com')
      andy.validate_invitable
      expect(andy.valid?).to eq true
    end
  end

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

  describe "subclass it" do
    it "validates name when valid" do
      andy = User3.new(name: "Andy Lindeman")
      expect(andy.valid?).to eq true
    end

    it "validates name when invalid" do
      user = User3.new
      expect(user.valid?).to eq false
    end

    it "OPTIONAL VALUDATION: validates email when User3::Invitable" do
      andy = User3::Invitable.new(name: "Andy Lindeman")
      expect(andy.valid?).to eq false
    end

    it "OPTIONAL VALUDATION: validates email" do
      andy = User3::Invitable.new(name: "Andy Lindeman", email: 'andy@dot.com')
      expect(andy.valid?).to eq true
    end

    it "still validates name" do
      andy = User3::Invitable.new(email: 'andy@dot.com')
      expect(andy.valid?).to eq false
    end
  end

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

  describe "inject the validations" do

  end
end
