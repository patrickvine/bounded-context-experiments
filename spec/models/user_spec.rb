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
  end

  describe "iffy in mixin" do

  end

  describe "optional mixin" do

  end

  describe "subclass it" do

  end

  describe "wrap and delegate it" do

  end

  describe "inject the validations" do

  end

  describe "invite command" do

  end
end
